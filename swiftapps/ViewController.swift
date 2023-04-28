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
    @IBOutlet var scoreLabel: UILabel!
    let hitMe = UIButton()
    let goID = UIButton()
    let identifierButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOverButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        hitMe.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        goID.addTarget(self, action: #selector(navigateByID), for: .touchUpInside)
        identifierButton.addTarget(self, action: #selector(switchWithIdentifier), for: .touchUpInside)
        startNewRound()
        buttonModifire()
        addConstraints()
    }
    @objc func navigateByID() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let statViewController = storyBoard.instantiateViewController(withIdentifier: "second") as! StatViewController
        statViewController.score = score
        present(statViewController, animated: true, completion: nil)
    }
    @objc func switchWithIdentifier(_ sender: Any) {
        performSegue(withIdentifier: "goVC", sender: nil)
    }
    
    @objc func showAlert() {
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
        hitMe.translatesAutoresizingMaskIntoConstraints = false
        identifierButton.translatesAutoresizingMaskIntoConstraints = false
        
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

        constraints.append(hitMe.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0))
        constraints.append(hitMe.bottomAnchor.constraint(equalTo: scoreCounter.topAnchor, constant: -50))
        
        constraints.append(identifierButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16))
        constraints.append(identifierButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16))
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
        hitMe.setTitle("Check", for: .normal)
        hitMe.backgroundColor = UIColor.blue
        hitMe.titleLabel?.textColor = UIColor.white
        hitMe.layer.cornerRadius = 10
        hitMe.layer.masksToBounds = true
        view.addSubview(hitMe)
        
        goID.setTitle("GO ID", for: .normal)
        goID.backgroundColor = UIColor.blue
        goID.titleLabel?.textColor = UIColor.white
        goID.layer.cornerRadius = 10
        goID.layer.masksToBounds = true
        view.addSubview(goID)
        
        startOverButton.backgroundColor = UIColor.white
        startOverButton.titleLabel?.textColor = UIColor.blue
        startOverButton.layer.cornerRadius = 10
        startOverButton.layer.masksToBounds = true
        
        identifierButton.setTitle("Identifire", for: .normal)
        identifierButton.backgroundColor = UIColor.blue
        identifierButton.titleLabel?.textColor = UIColor.white
        identifierButton.layer.cornerRadius = 10
        identifierButton.layer.masksToBounds = true
        view.addSubview(identifierButton)
    }

}

