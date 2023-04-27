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
    @IBOutlet var startOverButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        addConstraints()
    }
    @IBAction func switchWithIdentificator(_ sender: Any) {
        performSegue(withIdentifier: "goVC", sender: nil)
    }
    
    @IBAction func goID(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "second") as! SecondScreen
        self.present(newViewController, animated: true, completion: nil)
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
        score = 0
        scoreCounter.text = String(score)
        updateLabels()
    }
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        // Delete automatic constraints
        startOverButton.translatesAutoresizingMaskIntoConstraints = false
        // Add
        constraints.append(startOverButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16))
        constraints.append(startOverButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
}

