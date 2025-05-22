//
//  LocateImageButton.swift
//  Rover Photos
//
//  Created by Randy Varela on 5/20/25.
//

import SwiftUI

struct LocateImageButton: View {
    
    @ObservedObject var viewModel: RoverPhotoViewModel
    
    var body: some View {
        Button{
            viewModel.fetchRoverImage()
        } label: {
            Text("LOCATE IMAGE")
                .padding()
                .frame(width: 350, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor(_colorLiteralRed: 120/255, green: 103/255, blue: 83/255, alpha: 1.0)))
                )
                .foregroundColor(.white)
                .font(.custom("Roboto Mono", size: 24))
            //TODO: adjust this, currently wrong
                .padding(.top, -20)
        }
        .padding(.bottom, 40)
    }
}

//#Preview {
//    LocateImageButton()
//}
