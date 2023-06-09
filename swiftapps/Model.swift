//
//  Model.swift
//  swiftapps
//
//  Created by Denis Zhesterev on 29.04.2023.
//

import Foundation
class Model {
    var bestScore = 0
    var bestRound = 1
    var targetValue = 0
    var currentValue = 0
    var round = 1
    var score = 0
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        round += 1
        checkBestScore()
    }
    func startOverPressed() {
        round = 1
        score = 0
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
    func checkBestScore() {
        if score/round > bestScore/bestRound && round > 3 {
            bestRound = round
            bestScore = score
            UserDefaults.standard.set(bestRound, forKey: "round")
            UserDefaults.standard.set(bestScore, forKey: "score")
        }
    }
}
