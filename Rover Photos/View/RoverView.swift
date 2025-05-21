//
//  RoverView.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/7/25.
//

import SwiftUI

struct RoverView: View {
    
    @State var selectedRover : String = "SELECT ROVER"
    @State var selectDate : String = "SELECT DATE"
    @State var isPickerShowing : Bool = false
    @State var isDatepickerShowing : Bool = false
    @State var selectedDate = Date()
    
    let rovers = ["Curiosity", "Opportunity", "Spirit"]
    
    var body: some View {
        ZStack{
            BackgroundImage()
            VStack {
                RoverPhotoLogo()
                Spacer()
                
                RoverGreetingText()
                DownArrowImage()
                DefaultRoverImage()
                Spacer()
                
                Buttons(selectedRover: $selectedRover,
                        selectedDate: $selectedDate,
                        rovers: rovers)
                Spacer()
                
                LocateImageButton()
                AboutButton()
            }
        }
    }
}

#Preview {
    RoverView()
}

