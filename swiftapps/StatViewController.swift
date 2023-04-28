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
            scoreLabel.text = "Score: \(score)"
        }
    }
    let scoreLabel = UILabel()
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(scoreLabel)
            labelModifire()
            addConstraints()
        }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
        }
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(scoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    func labelModifire() {
        scoreLabel.text = "Score: \(score)"
    }
}
