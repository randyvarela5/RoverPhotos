//
//  RoverPhotoViewModel.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/13/25.
//

import SwiftUI
import Combine

class RoverPhotoViewModel: ObservableObject {
    
    @Published var selectedRover : String = "Curiosity"
    @Published var selectedDate : Date = Date()
    @Published var roverImage: UIImage? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private var roverManager = RoverManager()
    
    //Computed property to get date without time stamp
    private var formattedDate : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: selectedDate)
    }
    
    func fetchRoverImage() {
        
        isLoading = true
        errorMessage = nil
        
        roverManager.fetchUserSelectedRoverImage(roverName: selectedRover, date: selectedDate)
    }
    
    
}


