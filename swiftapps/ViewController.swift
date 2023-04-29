//
//  ViewController.swift
//  swiftapps
//
//  Created by Denis Zhesterev on 26.04.2023.
//

import UIKit

class ViewController: UIViewController {
    var model = Model()
    
    
    let targetLabel = UILabel()
    let scoreCounter = UILabel()
    let scoreLabel = UILabel()
    let roundLabel = UILabel()
    let roundCounter = UILabel()
    let hitMe = UIButton()
    let goID = UIButton()
    let identifierButton = UIButton()
    let startOverButton = UIButton()
    let slider = UISlider()
    
    let label1 = UILabel()
    let label100 = UILabel()
    let putYheBulls = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOverButton.addTarget(self, action: #selector(startOverPressedView), for: .touchUpInside)
        hitMe.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        goID.addTarget(self, action: #selector(navigateByID), for: .touchUpInside)
        identifierButton.addTarget(self, action: #selector(switchWithIdentifier), for: .touchUpInside)
        slider.addTarget(self, action: #selector(sliderMoved(_:)), for: .touchDragInside)
        startNewRoundView()
        buttonModifire()
        labelModefire()
        sliderModifire()
        addConstraints()
    }
    @objc func navigateByID() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let statViewController = storyBoard.instantiateViewController(withIdentifier: "second") as! StatViewController
        statViewController.score = model.score
        present(statViewController, animated: true, completion: nil)
    }
    @objc func switchWithIdentifier(_ sender: Any) {
        performSegue(withIdentifier: "goVC", sender: nil)
    }
    
    @objc func showAlert() {
        let message = "The target value is \(model.targetValue)" +
        "\n The value of the slider is \(model.currentValue)"
        let alert = UIAlertController(title: "title", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "titleAction", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        model.scoreCalculate()
        startNewRoundView()
    }
    @objc func sliderMoved(_ slider: UISlider) {
        model.currentValue = lroundf(slider.value)
    }
    func startNewRoundView() {
        model.startNewRound()
        slider.value = Float(model.currentValue)
        updateLabels()
        scoreCounter.text = String(model.score)
    }
    func updateLabels() {
        targetLabel.text = String(model.targetValue)
        roundCounter.text = String(model.round)
    }
    
    @objc func startOverPressedView() {
        model.startOverPressed()
        scoreCounter.text = String(model.score)
        updateLabels()
        startOverAnimation()
    }
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()

        startOverButton.translatesAutoresizingMaskIntoConstraints = false
        scoreCounter.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        goID.translatesAutoresizingMaskIntoConstraints = false
        roundCounter.translatesAutoresizingMaskIntoConstraints = false
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        hitMe.translatesAutoresizingMaskIntoConstraints = false
        identifierButton.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        label100.translatesAutoresizingMaskIntoConstraints = false
        putYheBulls.translatesAutoresizingMaskIntoConstraints = false
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
        constraints.append(hitMe.bottomAnchor.constraint(equalTo: scoreCounter.topAnchor, constant: -20))
        
        constraints.append(identifierButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16))
        constraints.append(identifierButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16))

        constraints.append(slider.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(slider.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(slider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75))
        
        constraints.append(label1.trailingAnchor.constraint(equalTo: slider.leadingAnchor, constant: -30))
        constraints.append(label1.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        
        constraints.append(label100.leadingAnchor.constraint(equalTo: slider.trailingAnchor, constant: 30))
        constraints.append(label100.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        
        constraints.append(putYheBulls.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(putYheBulls.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -70))
        
        constraints.append(targetLabel.leadingAnchor.constraint(equalTo: putYheBulls.trailingAnchor, constant: 30))
        constraints.append(targetLabel.centerYAnchor.constraint(equalTo: putYheBulls.centerYAnchor))
        
        
       
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func startOverAnimation() {
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
        
        goID.setTitle("Statistic", for: .normal)
        goID.backgroundColor = UIColor.blue
        goID.titleLabel?.textColor = UIColor.white
        goID.layer.cornerRadius = 10
        goID.layer.masksToBounds = true
        view.addSubview(goID)
        
        startOverButton.setTitle("Start Over", for: .normal)
        startOverButton.backgroundColor = UIColor.blue
        startOverButton.titleLabel?.textColor = UIColor.white
        startOverButton.layer.cornerRadius = 10
        startOverButton.layer.masksToBounds = true
        view.addSubview(startOverButton)
        
        identifierButton.setTitle("Identifire", for: .normal)
        identifierButton.backgroundColor = UIColor.blue
        identifierButton.titleLabel?.textColor = UIColor.white
        identifierButton.layer.cornerRadius = 10
        identifierButton.layer.masksToBounds = true
        view.addSubview(identifierButton)
    }
    func labelModefire() {
        scoreLabel.text = "Score"
        view.addSubview(scoreLabel)
        scoreCounter.text = "0"
        view.addSubview(scoreCounter)
        roundLabel.text = "Round:"
        view.addSubview(roundLabel)
        roundCounter.text = "1"
        view.addSubview(roundCounter)
        putYheBulls.text = "Put the Bulls's eye as close as you can to:"
        view.addSubview(putYheBulls)
        label1.text = "1"
        view.addSubview(label1)
        label100.text = "100"
        view.addSubview(label100)
        view.addSubview(targetLabel)
    }
    func sliderModifire() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        view.addSubview(slider)
    }
    
}

