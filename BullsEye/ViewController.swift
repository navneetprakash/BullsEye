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
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //method to start the round and gen new random number

        startNewRound()
        updateLabels()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction  func showAlert() {
        
        let message = "The value of slider is \(currentValue)" + "\n The target value is: \(targetValue)"
        
        //alert messasge window display
        let alert = UIAlertController(title: "Check Result", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        //present the alert
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
    
    }
    
    
    @IBAction func sliderMoved(slider: UISlider) {
        
        //store current value of slider to variable
        currentValue = lroundf(slider.value)
    
    }
    
    func startNewRound() {
        
        //        targetValue -  the highest number you will get is 99 because arc4random_uniform() treats
        //        the upper limit as exclusive. It only goes up-to 100, not up-to-and-including. To get
        //        a number that is truly in the range 1 - 100, you need to add 1 to the result of
        //        arc4random_uniform().
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        
        //Put the UISlider back to Float that is the currentValue
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels(){
            
            targetLabel.text = String(targetValue)
    }

}
