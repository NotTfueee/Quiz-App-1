
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreBoard: UILabel!
    @IBOutlet weak var quesText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
   
    
   var quizBrain = QuizBrain()
    
    var timer = Timer()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func answerPressed(_ sender: UIButton)
    {
        
        let userAns = sender.currentTitle!
        
        let userChoice = quizBrain.checkAnswer(userAns)
        
        
        
        if (userChoice)
        {
            trueButton.backgroundColor = UIColor.green
            
        }
        else
        {
            falseButton.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQues()
     
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
    }
    
    @objc func updateUI()
    {
        
        quesText.text = quizBrain.quesText()
        
        let progress = quizBrain.progress()
        
        scoreBoard.text = ("Score : \(quizBrain.getScore())")
        
        progressBar.progress = progress
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
         
    }
    
}

