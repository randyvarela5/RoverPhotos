//
//  BackgroundImage.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/20/25.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        Image("bg")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImage()
}
