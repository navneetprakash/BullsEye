//
//  ViewController.swift
//  BullsEye
//
//  Created by Navneet Prakash on 19/02/16.
//  Copyright © 2016 Navneet Prakash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score:Int = 0
    var round: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //method to start the round and gen new random number

        startNewGame()
        updateLabels()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction  func showAlert() {
        
        //finding the diffrence between the two values
        //use abs method to turn number to postive if it return a negative value
        
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        //custom title feedback based on the score
        let title:String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            points += 50
        }else if difference < 10 {
            title = "Pretty close!"
        }else {
            title = "Not even close!"
        }
        
        score += points
        let message = "You scored \(points) points"
        
        //alert messasge window display
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        //in the handler pass closure when button is tapped
        let action = UIAlertAction(title: "OK", style: .Default, handler: {action in self.startNewRound(); self.updateLabels() } )
        
        //present the alert
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    
    }
    
    
    @IBAction func sliderMoved(slider: UISlider) {
        
        //store current value of slider to variable
        currentValue = lroundf(slider.value)
    
    }
    
    @IBAction func startOver(sender: AnyObject) {

        startNewGame()
        updateLabels()
    }
    
    
    func startNewRound() {
        
        //        targetValue -  the highest number you will get is 99 because arc4random_uniform() treats
        //        the upper limit as exclusive. It only goes up-to 100, not up-to-and-including. To get
        //        a number that is truly in the range 1 - 100, you need to add 1 to the result of
        //        arc4random_uniform().
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        round += 1
        
        //Put the UISlider back to Float that is the currentValue
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    //restart game and reset all
    func startNewGame() {
        
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels(){
            
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}
