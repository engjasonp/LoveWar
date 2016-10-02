//
//  GameViewController.swift
//  LoveWar
//
//  Created by Jason Eng on 6/28/16.
//  Copyright © 2016 EngJason. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var playerCard1: UIButton!
    @IBOutlet weak var playerCard2: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    var numberOfPlayers: Int?
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (numberOfPlayers == 2) {
            view.backgroundColor = UIColor.blue
        }
        if (numberOfPlayers == 3) {
            view.backgroundColor = UIColor.red
        }
        if (numberOfPlayers == 4) {
            view.backgroundColor = UIColor.green
        }
        
        print("\(numberOfPlayers!) players")
        game.setUpGameLogic()
        
        // adds number of players up to playerCount and deals each one a new card from deck
        game.addPlayers(playerCount: numberOfPlayers!)
        
        //let playerCardImage1 = UIImage(named: game.players[game.currentTurn!].currentCards[0].image!)
        //let playerCardImage2 = UIImage(named: game.players[0].cardStringArray[1])
        //playerCard1.setImage(playerCardImage1, for: .normal)
        //playerCard2.setImage(playerCardImage2, for: .normal)
        
    }
    
}
