//
//  ViewController.swift
//  BullsEye
//
//  Created by Ibrahim Wassouf on 2022-10-01.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 1
    @IBOutlet var slider: UISlider!
    var targetValue: Int = 0
    @IBOutlet var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
        updateLabels()
    }

    
    @IBAction func showAlert() {
        let message = "The value of the slide is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello World",
                                  message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        targetValue = Int.random(in:1...100)
        currentValue = Int(slider.value)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
}

