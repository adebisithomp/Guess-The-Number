//
//  ViewController.swift
//  Guess The Number
//
//  Created by Adebisi Thompson on 9/6/16.
//  Copyright © 2016 Adebisi Thompson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    
    let lowerBound = 1
    let upperBound = 100
    
    //Variables
    var numberToGuess : Int!
    var numberOfGuesses = 0
    
    func generateRandomNumber() {
    numberToGuess = Int(arc4random_uniform(100)) + 1
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func submitButtonPressed(sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int (guess) {
                numberOfGuesses = numberOfGuesses + 1
                validateGuess(guessInt)
            
            }
        }
    }
    
    func validateGuess(guess: Int) {
        if (guess < lowerBound || guess > upperBound) {
            showBoundsAlert()
        } else if (guess > numberToGuess) {
            guessLabel.text = "Lower! 🔽"
        }else if (guess < numberToGuess) {
            guessLabel.text = "Higher! 🔼"
        } else {
            showWinAlert()
            guessLabel.text = "Guess the number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title : "Hey!" , message: "Your guess should be between 1 and 100", preferredStyle: .Alert )
        let action = UIAlertAction(title: "Got it", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congradulations! 🎉", message: "You won!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Great Job!", style: .Default , handler: nil)
        alert.addAction(action)
        self.presentViewController(alert,animated: true, completion: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    



}

