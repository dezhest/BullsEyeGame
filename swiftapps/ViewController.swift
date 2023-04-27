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
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var roundCounter: UILabel!
    @IBOutlet var scoreCounter: UILabel!
    @IBOutlet var startOverButton: UIButton!
    @IBOutlet var goID: UIButton!
    @IBOutlet var hitMe: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        addConstraints()
        startOverButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonModifire()
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
            score += 30
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
        scoreCounter.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        goID.translatesAutoresizingMaskIntoConstraints = false
        roundCounter.translatesAutoresizingMaskIntoConstraints = false
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        constraints.append(startOverButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16))
        constraints.append(startOverButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16))
        
        constraints.append(scoreLabel.centerXAnchor.constraint(equalTo: startOverButton.centerXAnchor, constant: view.frame.width/4))
        constraints.append(scoreLabel.centerYAnchor.constraint(equalTo: startOverButton.centerYAnchor))

        constraints.append(scoreCounter.centerXAnchor.constraint(equalTo: scoreLabel.trailingAnchor, constant: 20))
        constraints.append(scoreCounter.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor))
        
        
        constraints.append(goID.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16))
        constraints.append(goID.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16))

        constraints.append(roundCounter.centerXAnchor.constraint(equalTo: goID.centerXAnchor, constant: -view.frame.width/4))
        constraints.append(roundCounter.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor))

        constraints.append(roundLabel.trailingAnchor.constraint(equalTo: roundCounter.leadingAnchor, constant: -20))
        constraints.append(roundLabel.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor))
        NSLayoutConstraint.activate(constraints)
    }

    @objc func buttonTapped() {
        // добавляем анимацию на кнопку
        UIView.animate(withDuration: 0.5, animations: { [self] in
            self.startOverButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, animations: { [self] in
                self.startOverButton.transform = CGAffineTransform.identity
            })
        })
    }
    func buttonModifire() {
        hitMe.backgroundColor = UIColor(ciColor: .blue)
        hitMe.titleLabel?.textColor = UIColor(ciColor: .white)
        hitMe.layer.cornerRadius = 10
        hitMe.layer.masksToBounds = true
        
        startOverButton.backgroundColor = UIColor(ciColor: .white)
        startOverButton.titleLabel?.textColor = UIColor(ciColor: .blue)
        startOverButton.layer.cornerRadius = 10
        startOverButton.layer.masksToBounds = true
    }
}

