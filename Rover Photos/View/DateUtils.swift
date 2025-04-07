//
//  DateUtils.swift
//  Rover Photos
//
//  Created by Randy Varela on 4/6/25.
//

import Foundation
import UIKit

struct DateUtils {
    static func formatDatePickerToString(_ datePicker: UIDatePicker) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: datePicker.date)
    }
}
