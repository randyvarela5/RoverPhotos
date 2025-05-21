//
//  Buttons.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/20/25.
//

import SwiftUI

struct Buttons: View {
    
    @Binding var selectedRover : String
    @Binding var selectedDate : Date
    
    @State private var isPickerShowing = false
    @State private var isDatepickerShowing = false
    
    let rovers : [String]
    
    var selectDate : String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: selectedDate)
    }
    
    var body: some View {
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
        }    }
}

//#Preview {
//    Buttons(selectedRover: "Curiosity", selectedDate: "04-22-2018", isPickerShowing: true, isDatepickerShowing: <#T##arg#>, rovers: <#T##[String]#>)
//}
