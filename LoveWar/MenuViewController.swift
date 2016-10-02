//
//  ViewController.swift
//  LoveWar
//
//  Created by Jason Eng on 6/8/16.
//  Copyright © 2016 EngJason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = view.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let menuLabel: UILabel = UILabel(frame: CGRectMake(0, 0, screenWidth, 100))
        menuLabel.textAlignment = NSTextAlignment.Center
        menuLabel.textColor = UIColor.blackColor()
        menuLabel.text = "Love War"
        menuLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30.0)
        self.view.addSubview(menuLabel)
        
        let twoPlayersButton = UIButton(frame: CGRectMake((screenWidth/2) - 125/2, (screenHeight/2), 125, 25))
        twoPlayersButton.backgroundColor = UIColor.blueColor()
        twoPlayersButton.setTitle("2 Players", forState: .Normal)
        twoPlayersButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        twoPlayersButton.addTarget(self, action: #selector(twoPlayersTapped), forControlEvents: .TouchUpInside)
        
        let threePlayersButton = UIButton(frame: CGRectMake((screenWidth/2) - 125/2, (screenHeight/2) + 25, 125, 25))
        threePlayersButton.backgroundColor = UIColor.redColor()
        threePlayersButton.setTitle("3 Players", forState: .Normal)
        threePlayersButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        threePlayersButton.addTarget(self, action: #selector(threePlayersTapped), forControlEvents: .TouchUpInside)

        let fourPlayersButton = UIButton(frame: CGRectMake((screenWidth/2) - 125/2, (screenHeight/2) + 50, 125, 25))
        fourPlayersButton.backgroundColor = UIColor.greenColor()
        fourPlayersButton.setTitle("4 Players", forState: .Normal)
        fourPlayersButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        fourPlayersButton.addTarget(self, action: #selector(fourPlayersTapped), forControlEvents: .TouchUpInside)

        self.view.addSubview(twoPlayersButton)
        self.view.addSubview(threePlayersButton)
        self.view.addSubview(fourPlayersButton)
    }
    
    func twoPlayersTapped(sender: UIButton!) {
        print("2 Players tapped")
    }
    
    func threePlayersTapped(sender: UIButton!) {
        print("3 Players tapped")
    }
    
    func fourPlayersTapped(sender: UIButton!) {
        print("4 Players tapped")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

