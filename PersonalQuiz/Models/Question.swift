//
//  Question.swift
//  PersonalQuiz
//
//  Created by Victor on 16.12.2021.
//

struct Question {
    let title: String
    let type: ResponseType
    let answer: [Answer]
    
    static func getQuestions() -> [Question] {
       [
        Question(
                title: "What food do you prefer?",
                type: .single,
                answer: [
                    Answer(title: "Steak", type: .dog),
                    Answer(title: "Fish", type: .cat),
                    Answer(title: "Carrot", type: .rabbit),
                    Answer(title: "Corn", type: .turtle)
                 ]
       ),
        Question(
                title: "What do you like more?",
                type: .multiple,
                answer: [
                    Answer(title: "To swim", type: .dog),
                    Answer(title: "Sleep", type: .cat),
                    Answer(title: "To cuddle", type: .rabbit),
                    Answer(title: "To eat", type: .turtle)
                 ]
        ),
        Question(title: "Do you like drive trips?",
                type: .ranged,
                answer: [
                    Answer(title: "Hate", type: .cat),
                    Answer(title: "Nervous", type: .rabbit),
                    Answer(title: "Do not notice", type: .turtle),
                    Answer(title: "Adore", type: .dog)
                 ]
            )
       ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var defenition: String {
        switch self {
        case .dog:
           return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with yout friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You like everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "Your are wise beyond your years, and you focus on the details. Slow and steady wins the race"
        }
    }
}
