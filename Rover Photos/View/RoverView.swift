//
//  RoverView.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/7/25.
//

import SwiftUI

struct RoverView: View {
    
    @StateObject private var viewModel = RoverPhotoViewModel()
    
    //    @State var selectedRover : String = "SELECT ROVER"
    //    @State var selectDate : String = "SELECT DATE"
    //    @State var isPickerShowing : Bool = false
    //    @State var isDatepickerShowing : Bool = false
    //    @State var selectedDate = Date()
    
    @State var selectDate: String = "SELECT DATE"
    @State var isPickerShowing: Bool = false
    @State var isDatepickerShowing: Bool = false
    
    let rovers = ["Curiosity", "Opportunity", "Spirit"]
    
    var formattedDateString : String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: viewModel.selectedDate)
    }
    
    
    var body: some View {
        ZStack{
            BackgroundImage()
            VStack {
                RoverPhotoLogo()
                Spacer()
                
                RoverGreetingText()
                DownArrowImage()
                
                if let roverImage = viewModel.roverImage {
                    Image(uiImage: roverImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    //If rover photo renders wonky, adjust this.
                        .frame(width: 350, height: 350)
                } else {
                    DefaultRoverImage()
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .padding()
                }
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                Buttons(selectedRover: $viewModel.selectedRover,
                        selectedDate: $viewModel.selectedDate,
                        rovers: rovers)
                Spacer()
                
                LocateImageButton(viewModel: viewModel)
                AboutButton()
            }
        }
    }
}

extension Date {
    func formattedForNASA() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        return formatter.string(from: self)
        
    }
}

#Preview {
    RoverView()
}

