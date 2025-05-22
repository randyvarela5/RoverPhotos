//
//  DefaultRoverImage.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/20/25.
//

import SwiftUI

struct DefaultRoverImage: View {
    
    let isLoading : Bool
    
    var body: some View {
        ZStack {
            Image("newRover")
                .resizable()
                .scaledToFit()
                .frame(width: 380, height: 330)
            
            if isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
    }
}

//#Preview {
//    DefaultRoverImage()
//}
