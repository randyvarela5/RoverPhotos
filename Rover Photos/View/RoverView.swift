//
//  RoverView.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/7/25.
//

import SwiftUI

struct RoverView: View {
    
    @State var selectedRover : String = "Select Rover"
    @State var isPickerShowing : Bool = false
    
    let rovers = ["Curiosity", "Opportunity", "Spirit"]
    
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Image("logo")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 150, alignment: .center)
                
                
                Text("Hi there! Select a rover and date to see an actual image from the NASA Rover. Then download or share it with a friend. Have fun!")
                    .foregroundColor(.white)
                    .frame(width: 250, height: 70, alignment: .center)
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                    .font(.custom("Roboto-Mono", size: 15))
                    .padding(8)
                    .background(Color(UIColor(red: 70/255, green: 58/255, blue: 41/255, alpha: 1.0)))
                    .border(Color(.white))
                    .cornerRadius(10)
                    //.padding()
                
                Image("downarrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.top, -12)
                
                Image("newRover")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 315)
                
                HStack{
                    Button(action: {
                        isPickerShowing = true
                    }) {
                        HStack{
                            Text(selectedRover)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.white)
                            
                            //Spacer()
                            Image("downarrow")
                                .font(.system(size: 16, weight: .bold))
                        }
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(_colorLiteralRed: 277/255, green: 131/255, blue: 67/255, alpha: 1.0)))
                        )
                    }
                    .confirmationDialog("Select Rover", isPresented: $isPickerShowing, titleVisibility: .hidden) {
                        ForEach(rovers, id:\.self) { rover in
                            Button(rover) {
                                selectedRover = rover
                            }
                        }
                    }
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    RoverView()
}
