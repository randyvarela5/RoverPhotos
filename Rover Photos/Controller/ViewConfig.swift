//
//  ViewConfig.swift
//  Rover Photos
//
//  Created by Randy Varela on 4/6/25.
//

import Foundation
import UIKit

extension ViewController {
    
    func configureUI() {
        configureBorders()
        configureRoverMenu()
    }
    
    private func configureBorders() {
        findImageBtn.layer.cornerRadius = 10.0
        aboutBtn.layer.cornerRadius = 10.0
        greetingLabel.layer.cornerRadius = 10.0
        greetingLabel.layer.borderColor = UIColor.white.cgColor
    }
    
    func configureRoverMenu() {
        roverPopUpBtn.configuration?.title = "Select a Rover"
        roverPopUpBtn.menu = createRoverMenu()
    }
    
    private func createRoverMenu() -> UIMenu {
        return UIMenu(children: [
            UIAction(title: "Curiosity", handler: { [weak self] _ in
                self?.handleRoverSelection("Curiosity")
            }),
            UIAction(title: "Opportunity", handler: { [weak self] _ in
                self?.handleRoverSelection("Opportunity")
            }),
            UIAction(title: "Spirit", handler: { [weak self] _ in
                self?.handleRoverSelection("Spirit")
            })
        ])
    }
    
    private func handleRoverSelection(_ rover: String) {
        currentRover = rover
        roverPopUpBtn.setTitle(rover, for: .normal)
        print("\(rover) selected from the pop up button")
    }
}
