//
//  Game.swift
//  LoveWar
//
//  Created by Jason Eng on 7/19/16.
//  Copyright © 2016 EngJason. All rights reserved.
//

import Foundation

class Game {
    var cardsRemaining: Int = 16
    let deck = Deck()
    var shuffledDeck: [Card] = []
    var players: [Player] = []
    var currentTurn: Int?
    var numberOfWins: Int?
    
    func setUpGameLogic() {
        // sets up deck, shuffles it, then burns 1 card.
        shuffledDeck = self.deck.setUpDeck()
        printCards()
    }
    
    func printCards() {
        var counter = 0
        while counter < shuffledDeck.count {
            print(shuffledDeck[counter].title)
            counter += 1
        }
        print("\(shuffledDeck.count) cards remaining.")
    }
    
    func addPlayers(playerCount: Int) {
        // takes in player count, appends Player instance to players array up to playercount.
        var counter = 0
        while (counter < playerCount) {
            let playerCard = self.deck.deal()
            players.append(Player(currentCards: [playerCard]))
            counter += 1
        }
        print("\(shuffledDeck.count) cards remaining.")
    }
    
}
