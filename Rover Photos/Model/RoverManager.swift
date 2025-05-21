//
//  RoverManager.swift
//  Rover Photos
//
//  Created by Randy Varela on 3/28/25.
//

import Foundation
import UIKit
import Combine


protocol RoverManagerDelegate {
    func fetchSelectedRover() -> String
    func fetchSelectedDate() -> String
    func didUpdateRoverImage(imageURL: String)
}

class RoverManager {
    var delegate: RoverManagerDelegate?
    var selectedRover: String = ""
    
    func buildUrl() -> URL? {
        guard let selectedRover = delegate?.fetchSelectedRover(),
              let selectedDate = delegate?.fetchSelectedDate() else {
            print("Delegate method not available")
            return nil
        }
        
        let apiKey = APIConstants.nasaAPIKey
        let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/\(selectedRover)/photos?earth_date=\(selectedDate)&api_key=\(apiKey)"
        
        return URL(string: url)!
    }
    
    func performRequest(completion: @escaping () -> Void) {
        guard let url = buildUrl() else {
            print("Unable to build URL")
            return
        }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Unable to fetch data: \(error)")
                return
            }
            if let safeData = data {
                if let imageURL = self.parseJson(safeData) {
                    DispatchQueue.main.async {
                        self.delegate?.didUpdateRoverImage(imageURL: imageURL)
                        completion()
                    }
                } else {
                    DispatchQueue.main.async {
                        completion()
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
        task.resume()
        
    }
    
    func updateSelectedRover() -> String {
        if let rover = delegate?.fetchSelectedRover() {
            selectedRover = rover
        }
        return selectedRover
    }
    
    func parseJson(_ roverData: Data) -> String? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(RoverData.self, from: roverData)
            
            if let firstPhoto = decodedData.photos.first {
                let imageURL = firstPhoto.imgSrc
                print("Found image URL: \(imageURL)")
                return imageURL
            } else {
                print("No photos found in the response")
                return nil
            }
        } catch {
            print("Failed to decode: \(error)")
            return nil
        }
    }
    
    enum RoverError: Error, LocalizedError {
        case invalidURL
        case noPhotosFound
        case networkError (Error)
        case decodingError (Error)
        
        var errorDescription: String? {
            switch self {
                
            case .invalidURL:
                return "Invalid URL created"
            case .noPhotosFound:
                return "No photos found for this date"
            case .networkError(let error):
                return "Network error: \(error.localizedDescription)"
            case .decodingError(let error):
                return "Decoding error: \(error.localizedDescription)"
            }
        }
    }
    
    func fetchUserSelectedRoverImage(roverName: String, date: Date) -> AnyPublisher<UIImage, Error> {
        let apiKey = APIConstants.nasaAPIKey
        guard let url = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/\(roverName)/photos?earth_date=\(date.formattedForNASA())&api_key=\(apiKey)") else {
                return Fail(error: RoverError.invalidURL as Error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { RoverError.networkError($0) }
            .flatMap { data, response -> AnyPublisher<URL, RoverError> in
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(RoverData.self, from: data)
                    
                    guard let firstPhoto = decodedData.photos.first else {
                        return Fail(error: RoverError.noPhotosFound).eraseToAnyPublisher()
                    }
                    
                    guard let imageURL = URL(string: firstPhoto.imgSrc) else {
                        return Fail(error: RoverError.invalidURL).eraseToAnyPublisher()
                    }
                    return Just(imageURL)
                        .setFailureType(to: RoverError.self)
                        .eraseToAnyPublisher()
                } catch {
                    return Fail(error: RoverError.decodingError(error)).eraseToAnyPublisher()
                }
            }
            .flatMap { imageURL -> AnyPublisher<UIImage, RoverError> in
                //download the image
                URLSession.shared.dataTaskPublisher(for: imageURL)
                    .mapError { RoverError.networkError($0) }
                    .tryMap { data, _ -> UIImage in
                        guard let image = UIImage(data: data) else {
                            throw RoverError.decodingError(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not create image from data"]))
                        }
                        return image
                    }
                    .mapError { error -> RoverError in
                        if let roverError = error as? RoverError {
                            return roverError
                        }
                        return RoverError.decodingError(error)
                    }
                    .eraseToAnyPublisher()
            }
            .mapError { $0 as Error } // Convert RoverError to Error
            .eraseToAnyPublisher()
    }
}
