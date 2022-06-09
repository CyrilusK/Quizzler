import Foundation

struct QuizBrain {
    let questionsWithAnswers = [
        Question(q: "Планета Меркурий ближе всех остальных к Солнцу, чем все остальные?", a: true),
        Question(q: "Гепард быстрейший из всех наземных млекопитающих?", a: true),
        Question(q: "Человеческое тело состоит на 20% из воды?", a: false),
        Question(q: "Возраст дерева можно узнать по его высоте?", a: false),
        Question(q: "Папоротники одни из древнейших растений?", a: true),
        Question(q: "Тихий океан является самым маленьким океаном планеты?", a: false),
        Question(q: "Птица колибри способна развивать до 80 км/ч?", a: true),
        Question(q: "Человеческий скелет состоит из более 200 костей?", a: true),
        Question(q: "Крокодилы меняют цвет кожи, если чувствуют опасность?", a: false),
        Question(q: "Зубы у акулы регулярно сменяются?", a: true)
    ]
    let dictPossAnswers = ["Правда": true, "Ложь": false]
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswerUser(_ answer: String) -> Bool {
        if dictPossAnswers[answer] == questionsWithAnswers[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestion() -> String {
        questionsWithAnswers[questionNumber].question
    }
    
    mutating func increaseQuestionNumber() {
        if questionNumber < questionsWithAnswers.count - 1 {
            questionNumber += 1
        }
        else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getProgress() -> Float {
        return Float (questionNumber) / Float (questionsWithAnswers.count)
    }
    
    func getScore() -> Int {
        score
    }
}
