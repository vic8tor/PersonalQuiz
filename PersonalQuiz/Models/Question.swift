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
                title: "Which food do you like the most?",
                type: .single,
                answer: [
                    Answer(title: "Steak π₯©", type: .dog),
                    Answer(title: "Fish π", type: .cat),
                    Answer(title: "Carrots π₯", type: .rabbit),
                    Answer(title: "Corn π½", type: .turtle)
                 ]
       ),
        Question(
                title: "Which activities do you enjoy?",
                type: .multiple,
                answer: [
                    Answer(title: "Swimming π", type: .dog),
                    Answer(title: "Sleeping π΄", type: .cat),
                    Answer(title: "Cuddling π€", type: .rabbit),
                    Answer(title: "Eating π₯", type: .turtle)
                 ]
        ),
        Question(title: "How much do you enjoy car rides?",
                type: .ranged,
                answer: [
                    Answer(title: "I dislike them π΅", type: .cat),
                    Answer(title: "I get a little nervous π°", type: .rabbit),
                    Answer(title: "I barely notice themπ ", type: .turtle),
                    Answer(title: "I love them π€©", type: .dog)
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
    case dog = "πΆ"
    case cat = "π±"
    case rabbit = "π°"
    case turtle = "π’"
    
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
