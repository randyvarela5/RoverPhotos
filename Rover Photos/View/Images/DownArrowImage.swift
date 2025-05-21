//
//  DownArrowImage.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/20/25.
//

import SwiftUI

struct DownArrowImage: View {
    var body: some View {
        Image("downarrow")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .padding(.top, -12)
    }
}

#Preview {
    DownArrowImage()
}
