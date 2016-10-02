//
//  Deck.swift
//  LoveWar
//
//  Created by Jason Eng on 7/12/16.
//  Copyright © 2016 EngJason. All rights reserved.
//

import UIKit

class Deck: NSObject {

    var cards: [Card] = []
    
    struct quantity
    {
        static let soldier = 5
        static let priestess = 2
        static let baron = 2
        static let handmaid = 2
        static let prince = 2
        static let king = 1
        static let countess = 1
        static let princess = 1
    }
    
    // creates 8 instances of the Card class, each with unique property values.
    // adds card instances to cards
    func setUpDeck() -> [Card] {
        var cardOne, cardTwo, cardThree, cardFour, cardFive, cardSix, cardSeven, cardEight: Card
        cardOne = Card(value: 1)
        cardTwo = Card(value: 2)
        cardThree = Card(value: 3)
        cardFour = Card(value: 4)
        cardFive = Card(value: 5)
        cardSix = Card(value: 6)
        cardSeven = Card(value: 7)
        cardEight = Card(value: 8)
        
        for _ in 1...quantity.soldier {
            self.cards.append(cardOne)
        }
        for _ in 1...quantity.priestess {
            self.cards.append(cardTwo)
        }
        for _ in 1...quantity.baron {
            self.cards.append(cardThree)
        }
        for _ in 1...quantity.handmaid {
            self.cards.append(cardFour)
        }
        for _ in 1...quantity.prince {
            self.cards.append(cardFive)
        }
        for _ in 1...quantity.king {
            self.cards.append(cardSix)
        }
        for _ in 1...quantity.countess {
            self.cards.append(cardSeven)
        }
        for _ in 1...quantity.princess {
            self.cards.append(cardEight)
        }
        
        shuffleDeck()
        burn()
        return cards
    }
    
    func shuffleDeck() {
        for index in 0..<self.cards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(self.cards.count - 1)))
            let holder = self.cards[index]
            self.cards[index] = self.cards[randomIndex]
            self.cards[randomIndex] = holder
        }
    }
    
    func deal () -> Card {
        // removes last card of deck and returns a value of Card type
        return self.cards.removeLast()
    }
    
    func burn() {
        // returns deck instance without burned card
        self.cards.removeLast()
    }
}
