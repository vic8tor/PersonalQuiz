//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Victor on 21.12.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefenitionLabel: UILabel!
    var result: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
        
    defineWhichYouAnimal()
        
        let backBtn = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backBtn
    }
    

}

extension ResultViewController {
    private func defineWhichYouAnimal() {
        var responseAnswer: [AnimalType: Int] = [:]
        let responseType = result.map{ $0.type }
        responseType.forEach{
            responseAnswer[$0, default: 0] += 1
        }
        let greatestNumberAnswer = responseAnswer.max{ $0.value < $1.value }
        
        guard let resultAnswer = greatestNumberAnswer?.key.rawValue else { return }
        guard let defenition = greatestNumberAnswer?.key.defenition else { return }
        
        resultDefenitionLabel.text = defenition
        resultAnswerLabel.text = "You are - \(resultAnswer)!"
        
    }
    
}

extension ResultViewController {
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
