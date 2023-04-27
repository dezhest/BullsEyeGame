//
//  SecondScreen.swift
//  swiftapps
//
//  Created by Denis Zhesterev on 26.04.2023.
//

import Foundation
import UIKit

class SecondScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backButtonTapped(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
        }
}
