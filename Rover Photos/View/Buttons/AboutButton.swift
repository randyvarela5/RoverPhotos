//
//  AboutButton.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/20/25.
//

import SwiftUI

struct AboutButton: View {
    var body: some View {
        Button{
            print("about button pressed")
        } label: {
            Text("ABOUT")
                .foregroundStyle(.white)
                .font(.custom("Roboto Mono", size: 12))
                .padding(.top, -35)
        }
    }
}

#Preview {
    AboutButton()
}
