//
//  QuestionViewController.swift
//  PersonalQuiz
//
//  Created by Victor on 21.12.2021.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackVIew: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    
    @IBOutlet weak var questionProgresView: UIProgressView!
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answer
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
  
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else  { return }
        
        let currentAnswers = currentAnswers[buttonIndex]
        answersChoosen.append(currentAnswers)
        
        nextQuestion()
    }
    
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitchOne, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitchOne.isOn {
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    

    @IBAction func randedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answersChoosen.append(currentAnswers[index])
        
        nextQuestion()
    }
}

// MARK: - Private methods

extension QuestionViewController {
    private func setupUI() {
        for stackView in [singleStackView, multipleStackVIew, rangedStackView] {
            stackView?.isHidden = true
        }
    
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgresView.setProgress(totalProgress, animated: true)
        
        title = "Question № \(questionIndex + 1) from \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.type)
        

    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers )
        case .multiple:
            showMultipleStackView(with: currentAnswers )
        case .ranged:
            showRangedStackView(with: currentAnswers)
        }
    }

    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackVIew.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
        
    }
    

    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            setupUI()
            return
        } else {
            performSegue(withIdentifier: "showResult" , sender: nil)
        }
        
        
    }
}

