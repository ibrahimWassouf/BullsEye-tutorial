//
//  ViewController.swift
//  BullsEye
//
//  Created by Ibrahim Wassouf on 2022-10-01.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 1
    var score: Int = 0
    var targetValue: Int = 0
    var roundNumber: Int = 0
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
        updateLabels()
    }

    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        let message = "You scored \(points) points"
        score += points
        
        
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
        roundNumber += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(roundNumber)
    }
    
}

