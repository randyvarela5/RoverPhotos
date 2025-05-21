//
//  RoverGreetingText.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/20/25.
//

import SwiftUI

struct RoverGreetingText: View {
    var body: some View {
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

    }
}

#Preview {
    RoverGreetingText()
}
