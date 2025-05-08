//
//  RoverView.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/7/25.
//

import SwiftUI

struct RoverView: View {
    
    @State var selectedRover : String = "Select Rover"
    @State var selectDate : String = "Select Date"
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
                Spacer()
                HStack{
                    Button(action: {
                        isPickerShowing = true
                    }) {
                        // THis HStack has the button text and triangle only
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
                    Button(action: {
                        isDatepickerShowing = true
                    }) {
                        // THis HStack has the button text and triangle only
                        HStack{
                            Text(selectDate)
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
                    Text("Locate Image")
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor(_colorLiteralRed: 120/255, green: 103/255, blue: 83/255, alpha: 1.0)))
                        )
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    //TODO: adjust this, currently wrong
                        .padding(.top, 20)
                }
            }
        }
        
    }
}

#Preview {
    RoverView()
}
