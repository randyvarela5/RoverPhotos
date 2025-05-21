//
//  DefaultRoverImage.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/20/25.
//

import SwiftUI

struct DefaultRoverImage: View {
    var body: some View {
        Image("newRover")
            .resizable()
            .scaledToFit()
            .frame(width: 380, height: 330)
    }
}

#Preview {
    DefaultRoverImage()
}
