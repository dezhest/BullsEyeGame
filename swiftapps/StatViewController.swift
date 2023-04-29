//
//  SecondScreen.swift
//  swiftapps
//
//  Created by Denis Zhesterev on 26.04.2023.
//

import Foundation
import UIKit

class StatViewController: UIViewController {
    var score: Int = 0 {
        didSet {
            currentScore.text = "Current score: \(score)"
        }
    }
    var bestScore = UserDefaults.standard.string(forKey: "score")
    var bestRounds = UserDefaults.standard.string(forKey: "round")
    let currentScore = UILabel()
    let bestScoreLabel = UILabel()
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(currentScore)
            view.addSubview(bestScoreLabel)
            labelModifire()
            addConstraints()
        }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
        }
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        currentScore.translatesAutoresizingMaskIntoConstraints = false
        bestScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        constraints.append(currentScore.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(currentScore.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        
        constraints.append(bestScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(bestScoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50))
        
        
        NSLayoutConstraint.activate(constraints)
    }
    func labelModifire() {
        currentScore.text = "Current score: \(score)"
        bestScoreLabel.text = "Best score \(bestScore ?? "0") for \(bestRounds ?? "0") rounds"
    }
}
