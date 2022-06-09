import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var textQuestion: UILabel!
    @IBOutlet weak var progressOfAnswers: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quiz = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressOfAnswers.progress = 0.0
    }
    
    @IBAction func answerPressedButton(_ sender: UIButton) {
        if quiz.checkAnswerUser(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }

        quiz.increaseQuestionNumber()
        
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false)
        
        }
    
    @objc func updateUI() -> Void {
        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
        textQuestion.text = quiz.getQuestion()
        progressOfAnswers.progress = quiz.getProgress()
        ScoreLabel.text = "\(quiz.getScore()) / \(quiz.questionsWithAnswers.count)"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        //}
    }

}

