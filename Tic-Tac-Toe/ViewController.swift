//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Phanindhar Mothukuri on 3/9/15.
//  Copyright (c) 2015 phamot. All rights reserved.
//

// Second commit for git squash in develop

// Third commit for squashing in develop


import UIKit
import AVFoundation
class ViewController: UIViewController {
    var date = NSDate()
    var winner = 0
    var i=0
    var col1 = UIColor.yellowColor()
    var col2 = UIColor.redColor()
    var player = 0
    var col = UIColor()
    var gamestate = [2,2,2,2,2,2,2,2,2]
    let game = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var player1Sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("player1", ofType: "mp3")!)
    var player2Sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("player2", ofType: "mp3")!)
    var audioPlayer0 = AVAudioPlayer()
    var audioPlayer1 = AVAudioPlayer()
    var audioPlayer = AVAudioPlayer()
    @IBOutlet var button: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
   
    @IBAction func playAgainPressed(sender: AnyObject) {
        player = 0
        gamestate = [2,2,2,2,2,2,2,2,2]
        winner = 0
        label.center = CGPointMake(label.center.x-1400, label.center.y)
        playAgain.alpha = 0
        button.backgroundColor = UIColor.whiteColor()
          button1.backgroundColor = UIColor.whiteColor()
          button2.backgroundColor = UIColor.whiteColor()
        button3.backgroundColor = UIColor.whiteColor()
        button4.backgroundColor = UIColor.whiteColor()
        button5.backgroundColor = UIColor.whiteColor()
        button6.backgroundColor = UIColor.whiteColor()
        button7.backgroundColor = UIColor.whiteColor()
          button8.backgroundColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.purpleColor()
        
    }
    @IBOutlet var playAgain: UIButton!
    @IBOutlet var label: UILabel!
    @IBAction func buttonPressed(sender: AnyObject) {
        println(date)
       
        if player%2 == 0
        {
             col = col1
            
        }
        else
        {
             col = col2
            
        }
        if gamestate[sender.tag]==2 && player<9 && winner == 0{
            if player%2 == 0{
            audioPlayer = audioPlayer0
            }else
            {
                audioPlayer = audioPlayer1
            }
            
        if sender.tag==0{
            button.backgroundColor = col
            gamestate[0] = player%2
            audioPlayer.play()
        }else if sender.tag==1{
            button1.backgroundColor = col
            gamestate[1] = player%2
            audioPlayer.play()

        }else if sender.tag==2{
            button2.backgroundColor = col
            gamestate[2] = player%2
            audioPlayer.play()

        }else if sender.tag==3{
            button3.backgroundColor = col
            gamestate[3] = player%2
            audioPlayer.play()

        }else if sender.tag==4{
            button4.backgroundColor = col
            gamestate[4] = player%2
            audioPlayer.play()

        }else if sender.tag==5{
            button5.backgroundColor = col
            gamestate[5] = player%2
            audioPlayer.play()

        }else if sender.tag==6{
            button6.backgroundColor = col
            gamestate[6] = player%2
            audioPlayer.play()

        }else if sender.tag==7{
            button7.backgroundColor = col
            gamestate[7] = player%2
            audioPlayer.play()

        }else if sender.tag==8{
            button8.backgroundColor = col
            gamestate[8] = player%2
            audioPlayer.play()

        }
        player++
            
           for i in game{
                if (gamestate[i[0]] == gamestate[i[1]] && gamestate[i[1]] == gamestate[i[2]] && gamestate[i[0]] != 2){
                    if gamestate[i[0]]==0{
                        winner = 1
                        label.alpha = 0.7
                    label.text = "Yellow is Winner"
                        label.backgroundColor = col1
                        UIView.animateWithDuration(1, animations:{ self.label.center = CGPointMake(self.label.center.x+1400, self.label.center.y); self.playAgain.alpha = 1})
                    }else if gamestate[i[0]]==1{
                        label.text = "Red is Winner"
                        label.alpha = 0.7
                        label.backgroundColor = col2
                        winner = 1
                        UIView.animateWithDuration(1, animations:{ self.label.center = CGPointMake(self.label.center.x+1400, self.label.center.y);self.playAgain.alpha = 1})

            }
                    
                }else if player == 9{
                    label.text = "Game Drawn"
                    winner = 1
                    label.backgroundColor = UIColor.purpleColor()
label.alpha = 0.7
                    UIView.animateWithDuration(1, animations:{ self.label.center = CGPointMake(self.label.center.x+1400, self.label.center.y); self.playAgain.alpha = 1})
            }
           }
        }
    }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer0 = AVAudioPlayer(contentsOfURL: player1Sound, error: nil)
        audioPlayer1 = AVAudioPlayer(contentsOfURL: player2Sound, error: nil)
        audioPlayer0.prepareToPlay()
        audioPlayer1.prepareToPlay()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
     label.center = CGPointMake(label.center.x-1400, label.center.y)
        playAgain.center = CGPointMake(playAgain.center.x-1400, playAgain.center.y)
        playAgain.alpha = 0
    }

}

