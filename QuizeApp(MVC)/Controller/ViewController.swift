//
//  ViewController.swift
//  QuizeApp(MVC)
//
//  Created by Ashraf Eltantawy on 12/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var progrss: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    var quizeBrain = QuizeBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    
    @IBAction func buttonClick(_ sender: UIButton) {
        let answer=quizeBrain.chececkAnswer(an: sender.currentTitle!)
    
        if(answer==true){
            sender.backgroundColor = .green
        }else{
            sender.backgroundColor = .red
        }
        quizeBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
    }
    @objc func updateUi(){
        questionLabel.text = quizeBrain.getQuestionText()
        progrss.progress = quizeBrain.getProgress() 
//        scoreLabel.text = "Score: \(quizBrain?.getScore() ?? 0)"
        if quizeBrain.getLastQuestion(){
           let alert = UIAlertController(title: "Score", message: "Your Score is \(quizeBrain.getScore())", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default){_ in
                self.quizeBrain.clearScore()
                self.dismiss(animated: true)
                
            }
            alert.addAction(okButton)
            present(alert, animated: true)
        }
        
        btnTrue.backgroundColor = .white
        btnFalse.backgroundColor = .white
    }
}

