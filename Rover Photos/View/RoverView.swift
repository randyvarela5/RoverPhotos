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
                    .frame(width: 300, height: 70, alignment: .center)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .font(.custom("Roboto Mono", size: 11))
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor(red: 70/255, green: 58/255, blue: 41/255, alpha: 1.0)))
                    )
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 5)
                    }

                Image("downarrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.top, -12)
                
                Image("newRover")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 330)
                Spacer()
                HStack{
                    Button(action: {
                        isPickerShowing = true
                    }) {
                        // This HStack has the button text and triangle only
                        HStack{
                            Text(selectedRover)
                                .font(.custom("Roboto Mono", size: 15))
                                .foregroundStyle(.white)
                            
                            Image("downarrow")
                                .font(.system(size: 16, weight: .bold))
                        }
                        .padding()
                        .frame(width: 170, height: 50)
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
                    Button(action: {
                        isDatepickerShowing = true
                    }) {
                        // This HStack has the button text and triangle only
                        HStack{
                            Text(selectDate)
                                .font(.custom("Roboto Mono", size: 15))
                                .foregroundStyle(.white)
                            
                            //Spacer()
                            Image("downarrow")
                                .font(.system(size: 16, weight: .bold))
                        }
                        .padding()
                        .frame(width: 170, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(_colorLiteralRed: 277/255, green: 131/255, blue: 67/255, alpha: 1.0)))
                        )
                    }
                    .sheet(isPresented: $isDatepickerShowing) {
                        if #available(iOS 16.0, *) {
                            VStack {
                                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .padding()
                                Button("Done") {
                                    isDatepickerShowing = false
                                }
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()
                            }
                            .presentationDetents([.height(400)])
                        }
                    }
                }
                Spacer()
             
                Button{
                    print("Locate Image Pressed")
                } label: {
                    Text("LOCATE IMAGE")
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(_colorLiteralRed: 120/255, green: 103/255, blue: 83/255, alpha: 1.0)))
                        )
                        .foregroundColor(.white)
                        .font(.custom("Roboto Mono", size: 24))
                    //TODO: adjust this, currently wrong
                        .padding(.top, -20)
                }
                .padding(.bottom, 40)
                
                Button{
                    print("about button pressed")
                } label: {
                    Text("ABOUT")
                        .foregroundStyle(.white)
                        .font(.custom("Roboto Mono", size: 12))
                        .padding(.top, -35)
                }
                Text("© 2025 Developed by Randy Varela. Designed by Ben Peacock")
                    .font(.custom("Roboto Mono", size: 8))
                    .foregroundStyle(.orange)
            }
        }
        
    }
}

#Preview {
    RoverView()
}
