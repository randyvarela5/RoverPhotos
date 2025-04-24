//
//  ViewController.swift
//  Rover Photos
//
//  Created by Randy Varela on 3/26/25.
//

import UIKit

class ViewController: UIViewController, RoverManagerDelegate {
    
    let roverManager = RoverManager()
    var currentRover: String = "Select a Rover"
    
    @IBOutlet weak var roverImage: UIImageView!
    @IBOutlet weak var findImageBtn: UIButton!
    @IBOutlet weak var roverPopUpBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var aboutBtn: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roverManager.delegate = self
        configureUI()
        roverPopUpBtn.setTitle("Select a Rover", for: .normal)
        roverPopUpBtn.menu = createRoverMenu()
        roverPopUpBtn.showsMenuAsPrimaryAction = true
    }
    
    @IBAction func findImageBtnPressed(_ sender: Any) {
        activitySpinner.startAnimating()
        roverManager.performRequest { [weak self] in
            DispatchQueue.main.async {
                self?.updateImageUI()
                self?.activitySpinner.stopAnimating()
            }
        }
    }
    
    @IBAction func aboutBtnPressed(_ sender: Any) {
        guard let aboutVC = storyboard?.instantiateViewController(withIdentifier: "AboutVC") as? AboutVC
        else { return }
        present(aboutVC, animated: true)
    }
    
    func fetchSelectedRover() -> String {
        currentRover = (roverPopUpBtn.titleLabel?.text)!
        return currentRover
    }
    
    func fetchSelectedDate() -> String {
        return DateUtils.formatDatePickerToString(datePicker)
    }
    
    func didUpdateRoverImage(imageURL: String) {
        RoverImageFetcher.fetchImage(from: imageURL) { [weak self] image in
            self?.roverImage.image = image
        }
    }
}

