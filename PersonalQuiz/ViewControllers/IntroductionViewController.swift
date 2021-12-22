//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Victor on 16.12.2021.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        }
    
    override func viewDidLoad() {
        setGradient()
    }
}

extension IntroductionViewController {
    private func setGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.systemYellow.cgColor,
            UIColor.systemGreen.cgColor,
            UIColor.systemGray.cgColor
        ]
        view.layer.insertSublayer(gradient, at: 0)
    }
}
