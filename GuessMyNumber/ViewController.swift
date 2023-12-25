//
//  ViewController.swift
//  GuessMyNumber
//
//  Created by Ömer Can Güleç on 25.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var trialLabel: UILabel!
    
    var randomNum:Int?
    var remainingTrial = 5
    var result:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
        numberLabel.layer.masksToBounds = true
        numberLabel.layer.cornerRadius = 20
        
        randomNum = Int.random(in: 0...20)
        
    }

    @IBAction func checkBtn(_ sender: Any) {
        remainingTrial -= 1
        
        if let number = textField.text {
            if let num = Int(number) {
                if (num == randomNum) {
                    result = true
                    updateUI()
                }
                if (num > randomNum!) {
                    suggestionLabel.text = "Too High!"
                    trialLabel.text = "Remainig trial: \(remainingTrial)"
                }
                if (num < randomNum!) {
                    suggestionLabel.text = "Too Low!"
                    trialLabel.text = "Remainig trial: \(remainingTrial)"
                }
                if(remainingTrial == 0) {
                    result = false
                    updateUI()
                }
            }
        }
    }
    
    @IBAction func restartBtn(_ sender: Any) {
       startGame()
    }
    
    func updateUI(){
        textField.isHidden = true
        trialLabel.isHidden = true
        checkButton.isHidden = true
        againButton.isHidden = false
        numberLabel.text = "\(randomNum!)"
        
        
        if (result!) {
            view.backgroundColor = UIColor(named: "victoryColor")
            suggestionLabel.text = "You win! 🎉"
        } else {
            view.backgroundColor = UIColor(named: "lostColor")
            suggestionLabel.text = "You lost! 🙁"
        }
    }
    
    func startGame(){
        textField.isHidden = false
        trialLabel.isHidden = false
        checkButton.isHidden = false
        againButton.isHidden = true
        remainingTrial = 5
        trialLabel.text = "Remainig trial: \(remainingTrial)"
        suggestionLabel.text = "Let's first guess 👇"
        numberLabel.text = "?"
        view.backgroundColor = UIColor(named: "backgroundColor")
        textField.text = ""
        randomNum = Int.random(in: 0...20)
    }
    
}

