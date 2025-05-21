//
//  RoverPhotoLogo.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/20/25.
//

import SwiftUI

struct RoverPhotoLogo: View {
    var body: some View {
        Image("logo")
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: 174, height: 125, alignment: .center)
            .padding(.bottom, 2)
    }
}

#Preview {
    RoverPhotoLogo()
}
