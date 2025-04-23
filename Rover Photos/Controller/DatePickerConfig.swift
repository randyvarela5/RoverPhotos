//
//  DatePickerConfig.swift
//  Rover Photos
//
//  Created by Randy Varela on 4/23/25.
//

import Foundation



extension ViewController {
    
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
