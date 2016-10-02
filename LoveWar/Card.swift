//
//  Card.swift
//  LoveWar
//
//  Created by Jason Eng on 7/12/16.
//  Copyright © 2016 EngJason. All rights reserved.
//

import UIKit

class Card {
    var title: String?
    var image: String?
    var value: Int?
    
    // initializes the properties of a Card class.
    init(value: Int) {
        populateCardValues(value: value)
    }
    
    private func populateCardValues(value: Int) {
        self.value = value
        
        switch value
        {
        case 1:
            self.title = "soldier"
            self.image = "guard.png"
        case 2:
            self.title = "priestess"
            self.image = "priestess.png"
        case 3:
            self.title = "baron"
            self.image = "baron.png"
        case 4:
            self.title = "handmaid"
            self.image = "handmaid.png"
        case 5:
            self.title = "prince"
            self.image = "prince.png"
        case 6:
            self.title = "king"
            self.image = "king.png"
        case 7:
            self.title = "countess"
            self.image = "countess.png"
        case 8:
            self.title = "princess"
            self.image = "princess.png"
        default:
            return
        }
    }
}
