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
    
    func createRoverMenu() -> UIMenu {
        roverPopUpBtn.layer.cornerRadius = 10.0
        let curiosityAction = UIAction(title: "Curiosity") {_ in
            self.roverPopUpBtn.setTitle("Curiosity", for: .normal)
            self.updateDatePickerRange()
        }
        let opportunityAction = UIAction(title: "Opportunity") {_ in
            self.roverPopUpBtn.setTitle("Opportunity", for: .normal)
            self.updateDatePickerRange()
        }
        let spiritAction = UIAction(title: "Spirit") {_ in
            self.roverPopUpBtn.setTitle("Spirit", for: .normal)
            self.updateDatePickerRange()
        }
        
        return UIMenu(children: [curiosityAction, opportunityAction, spiritAction])
    }
    
    private func handleRoverSelection(_ rover: String) {
        currentRover = rover
        roverPopUpBtn.setTitle(rover, for: .normal)
        print("\(rover) selected from the pop up button")
    }
    
    func updateImageUI() {
        roverImage.layer.borderWidth = 5
        roverImage.layer.borderColor = UIColor.white.cgColor
        roverImage.layer.cornerRadius = 10.0
    }
    
    func updateDatePickerRange() {
        print("Date picker range updated")
        print("Current button title is: \(roverPopUpBtn.currentTitle ?? "No title")")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if roverPopUpBtn.currentTitle == "Curiosity" {
            if let minDate = dateFormatter.date(from: "2012-08-06") {
                datePicker.minimumDate = minDate
            }
            if let maxDate = dateFormatter.date(from: Date().description) {
                datePicker.maximumDate = maxDate
            }
        }
        if roverPopUpBtn.currentTitle == "Opportunity" {
            if let minDate = dateFormatter.date(from: "2004-01-25") {
                datePicker.minimumDate = minDate
            }
            if let maxDate = dateFormatter.date(from: "2018-05-31") {
                datePicker.maximumDate = maxDate
            }
        }
        if roverPopUpBtn.currentTitle == "Spirit" {
            if let minDate = dateFormatter.date(from: "2004-01-04") {
                datePicker.minimumDate = minDate
            }
            if let maxDate = dateFormatter.date(from: "2010-02-28") {
                datePicker.maximumDate = maxDate
            }
        }
    }
}
