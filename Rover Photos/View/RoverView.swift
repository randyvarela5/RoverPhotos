//
//  RoverView.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/7/25.
//

import SwiftUI

struct RoverView: View {
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
                    Button {
                        print("Rover button pushed")
                    } label: {
                        Text("Select Rover")
                            .frame(width: 160, height: 50)
                            .background(Color(.orange))
                            .foregroundStyle(.white)
                            .font(.custom("Roboto-Mono", size: 24))
                    }
                    Button {
                        print("Date button pushed")
                    } label: {
                        Text("Select Date")
                            .frame(width: 160, height: 50)
                            .background(Color(.orange))
                            .foregroundStyle(.white)
                            .font(.custom("Roboto-Mono", size: 24))
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
