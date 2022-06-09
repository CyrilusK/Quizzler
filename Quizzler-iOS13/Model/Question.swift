import Foundation

struct Question {
    let question: String
    let answer: Bool
    
    init(q: String, a: Bool) {
        question = q
        answer = a
    }
}
