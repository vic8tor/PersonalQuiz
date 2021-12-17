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
        Question(title: "Какую пищу предпочитаете?",
                 type: .single,
                 answer: [
                    Answer(title: "Стейк", type: .dog),
                    Answer(title: "Рыба", type: .cat),
                    Answer(title: "Морковь", type: .rabbit),
                    Answer(title: "Кукуруза", type: .turtle)
                    
                 ])
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
           return "You like being with friends. You surround yourself"
        case .cat:
            return " Вы у себя на уме"
        case .rabbit:
            return "Вам нравится все мягкое"
        case .turtle:
            return "Ваша сила - в мудрости"
        }
    }
}
