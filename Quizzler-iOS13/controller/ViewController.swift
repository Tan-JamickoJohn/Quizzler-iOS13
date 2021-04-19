//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var labelScore: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionText.text = quizBrain.getCurrentQuestionText()
        labelScore.text = "Score: 0"
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle ?? ""
        let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = isAnswerCorrect
            ? UIColor.green
            : UIColor.red
    
        quizBrain.nextQuestion()
 
        Timer.scheduledTimer(timeInterval: 0.2,
                             target: self,
                             selector: #selector(updateUI),
                             userInfo: nil,
                             repeats: false)
    }
    
    @objc func updateUI(){
        questionText.text = quizBrain.getCurrentQuestionText()
        labelScore.text = "Score: \(quizBrain.getScore())"
        btnTrue.backgroundColor = UIColor.clear
        btnFalse.backgroundColor = UIColor.clear
        progressView.progress = quizBrain.getProgress()
    } 
    
}

