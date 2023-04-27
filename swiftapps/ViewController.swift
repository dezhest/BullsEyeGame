//
//  ViewController.swift
//  swiftapps
//
//  Created by Denis Zhesterev on 26.04.2023.
//

import UIKit

class ViewController: UIViewController {
    var targetValue = 0
    var currentValue = 0
    var round = 0
    var score = 0
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var roundCounter: UILabel!
    @IBOutlet var scoreCounter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
    }
    
    @IBAction func showAlert() {
        let message = "The target value is \(targetValue)" +
        "\n The value of the slider is \(currentValue)"
        let alert = UIAlertController(title: "title", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "titleAction", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        scoreCalculate()
        startNewRound()
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
        scoreCounter.text = String(score)
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        roundCounter.text = String(round)
    }

    func scoreCalculate() {
        switch targetValue - currentValue {
        case 4, -4:
            score += 1
        case 3, -3:
            score += 2
        case 2, -2:
            score += 3
        case 1, -1:
            score += 4
        case 0:
            score += 5
        default: break
        }
    }
    @IBAction func startOverPressed() {
        round = 1
        scoreCounter.text = String(score)
        score = 0
        updateLabels()
    }
}

