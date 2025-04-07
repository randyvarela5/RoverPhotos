//
//  RoverManager.swift
//  Rover Photos
//
//  Created by Randy Varela on 3/28/25.
//

import Foundation
import UIKit

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
        
        let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/\(selectedRover)/photos?earth_date=\(selectedDate)&api_key=PyyAhi50PEAnBZU9C5F2uhc6800rXWUkcb2UlsAq"

        return URL(string: url)!
    }
    
    func performRequest() {
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
                    }
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
}
