//
//  ViewController.swift
//  StopnGo
//
//  Created by Denis Thamrin on 27/10/2014.
//  Copyright (c) 2014 ___DenisThamrin___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var score: UILabel!
    @IBOutlet var MainGameView: UIView!
    @IBOutlet var button: UIButton!
    
    //why !
    var gamescore:GameScore!
    //Maybe nil !
    var lightlogic:LightLogic?
    
    
    //adapted from stopwatch http://rshankar.com/simple-stopwatch-app-in-swift/
    var startTime = NSTimeInterval()
   
    //Update the light in the view based on the light logic
    func updateLight() {
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        if (lightlogic != nil){
        lightlogic!.updateLightLogic(seconds,minute:minutes)
        
            //TODO should be get set ? Nope swift actually calls the getter
            if(lightlogic!.safeToPress){
     
                self.button.setImage(UIImage(named:"cookie-1"), forState: .Normal)
            } else {
                self.button.setImage(UIImage(named: "elmo--2-2"), forState: .Normal)
      
            }
        }
        
        
    }
    
    //end of adaptation
    
    override func viewDidLoad() {
        // Init the classes
        super.viewDidLoad()
        initGame()
        
        // Timer code from rshankar
        
        var timer = NSTimer()
        let aSelector : Selector = "updateLight"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()

    }
    
    
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func buttonTouch(sender: AnyObject) {
        if (lightlogic != nil){
            if (lightlogic!.safeToPress){
                addScore()
            }
            else{
                self.button.setImage(UIImage(named:"default"), forState: .Normal)
                lightlogic = nil
                self.button.setTitle("Retry ?",forState: .Normal)
            }
        }
        // restart game
        else{
            initGame()
            
        }
       
    }
    
    // update view and add score
    func addScore(){
        gamescore.addScore()
        updateScore()
    }
    
    func updateScore(){
        score.text = "Score: " + String(gamescore.score)
    }
    
    func initGame(){
        self.gamescore = GameScore()
        self.lightlogic = LightLogic()
        self.button.setTitle("",forState: .Normal)
        score.text = "Score: " + String(gamescore.score)
    }
    
    // Deprecated code because UITextfield cannot be animated
    //override func viewDidAppear(animated: Bool){
    //self.light.textColor = UIColor.greenColor()
    //UIView.animateWithDuration(1, delay: 0.2, options: UIViewAnimationOptions.Repeat, animations: {
    //    self.light.textColor = UIColor.redColor()
    //     self.light.textColor = UIColor.blueColor()
    // }, completion: nil
    
    //)
    //}


}


