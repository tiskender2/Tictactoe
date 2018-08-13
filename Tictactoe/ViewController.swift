//
//  ViewController.swift
//  Tictactoe
//
//  Created by tolga iskender on 13.08.2018.
//  Copyright © 2018 tolga iskender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    var winner = -1
    var activePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func button_click(_ sender: Any) {
       
       let button = sender as! UIButton
       playGame(button: button)
    }
    
    
    func playGame(button: UIButton) {
     
        if activePlayer == 1  {
            button.setTitle("X", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            player1.append(button.tag)
            activePlayer = 2
            print(player1)
            if winner != 1 || winner != 0 {
                  AutoPlay()
            }
          
        }
        else
        {
            button.setTitle("O", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            player2.append(button.tag)
            activePlayer = 1
            print(player2)
        }
        button.isEnabled = false
        findWinner(button: button)
    }
    
    func findWinner(button: UIButton) {
        
        for i in stride(from: 1, to: 7, by: 3) {
        if (player1.contains(i) && player1.contains(i+1) && player1.contains(i+2))
        {
            winner = 1
        }
        if (player2.contains(i) && player2.contains(i+1) && player2.contains(i+2))
        {
            winner = 2
        }
        }
        for i in 1...3 {
            if (player1.contains(i) && player1.contains(i+3) && player1.contains(i+6))
            {
                winner = 1
            }
            if (player2.contains(i) && player2.contains(i+3) && player2.contains(i+6))
            {
                winner = 2
            }
        }
       
            if (player1.contains(1) && player1.contains(5) && player1.contains(9))
            {
                winner = 1
            }
            if (player2.contains(1) && player2.contains(5) && player2.contains(9))
            {
                winner = 2
            }
            if (player1.contains(3) && player1.contains(5) && player1.contains(7))
            {
                winner = 1
            }
            if (player2.contains(3) && player2.contains(5) && player2.contains(7))
            {
                winner = 2
            }
        
        
        if winner != -1 {
            
            var msg = ""
            var title = ""
            if winner == 1 {
                msg = "Player 1 is winner"
                title = "Winner"
            }
            else if winner == 2 {
                msg = "Player 2 is winner"
                title = "Winner"
            }
            else {
                msg = "Match is Draw"
                title = "Draw"
            }
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                self.playAgain(button: button)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    func AutoPlay () {
        
        var emptyCells = [Int]()
        
        for index in 1...9 {
            
            if !(player1.contains(index) || player2.contains(index)) {
                emptyCells.append(index)
            }
        }
        
        let randIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cellId = emptyCells[Int(randIndex)]
        var buttonSelect:UIButton?
        switch cellId {
        case 1:
            buttonSelect = button1
        case 2:
            buttonSelect = button2
        case 3:
            buttonSelect = button3
        case 4:
            buttonSelect = button4
        case 5:
            buttonSelect = button5
        case 6:
            buttonSelect = button6
        case 7:
            buttonSelect = button7
        case 8:
            buttonSelect = button8
        case 9:
            buttonSelect = button9
        default:
            buttonSelect = button1
        }
        playGame(button: buttonSelect!)
    }
    func playAgain(button: UIButton)
    {
        button.isEnabled = true
        activePlayer = 1
        winner = -1
        player1.removeAll()
        player2.removeAll()
        for _ in 1...9 {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        
    }
    
}

