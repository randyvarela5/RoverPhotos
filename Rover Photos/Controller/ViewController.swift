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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roverManager.delegate = self
        
        findImageBtn.layer.cornerRadius = 10.0
        aboutBtn.layer.cornerRadius = 10.0
        roverPopUpBtn.configuration?.title = "Select a Rover"
        greetingLabel.layer.cornerRadius = 10.0
        greetingLabel.layer.borderColor = UIColor.white.cgColor
        
        roverPopUpBtn.menu = UIMenu(children: [
            UIAction(title: "Curiosity", handler: { [weak self] _ in
                self?.currentRover = "Curiosity"
                self?.roverPopUpBtn.setTitle("Curiosity", for: .normal)
                print("Curiosity selected from pop up button")}),
            UIAction(title: "Opportunity", handler: { [weak self] _ in
                self?.currentRover = "Opportunity"
                self?.roverPopUpBtn.setTitle("Opportunity", for: .normal)
                print("Opportunity selected from pop up button")}),
            UIAction(title: "Spirit", handler: { [weak self] _ in
                self?.currentRover = "Spirit"
                self?.roverPopUpBtn.setTitle("Spirit", for: .normal)
                print("Spirit selected from pop up button")})
        ])
        
    }
    
    @IBAction func findImageBtnPressed(_ sender: Any) {
        
        roverManager.updateSelectedRover()
        roverManager.performRequest()
    }
    
    @IBAction func aboutBtnPressed(_ sender: Any) {
        guard let aboutVC = storyboard?.instantiateViewController(withIdentifier: "AboutVC") as? AboutVC
        else { return }
        present(aboutVC, animated: true)
    }
    
    func fetchSelectedRover() -> String {
        return currentRover
    }
    
    func fetchSelectedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let selectedDate = formatter.string(from: datePicker.date)
        return selectedDate
    }
    
    func didUpdateRoverImage(imageURL: String) {
        
        if let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                
                if let error = error {
                    print("Failed to fetch image: \(error)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.roverImage.image = image
                    }
                }
            }.resume()
        }
    }
}

