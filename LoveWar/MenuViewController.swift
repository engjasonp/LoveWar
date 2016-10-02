//
//  ViewController.swift
//  LoveWar
//
//  Created by Jason Eng on 6/8/16.
//  Copyright © 2016 EngJason. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class MenuViewController: UIViewController, MCBrowserViewControllerDelegate {
    
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    var numberOfPlayers: Int?
    var appDelegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = view.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let menuLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 100))
        menuLabel.textAlignment = NSTextAlignment.center
        menuLabel.textColor = UIColor.black
        menuLabel.text = "Love War"
        menuLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30.0)
        self.view.addSubview(menuLabel)
        
        let twoPlayersButton = UIButton(frame: CGRect(x: 0, y: (screenHeight/2) - 100, width: screenWidth, height: 100))
        twoPlayersButton.backgroundColor = UIColor.blue
        twoPlayersButton.setTitle("2 Players", for: UIControlState())
        twoPlayersButton.setTitleColor(UIColor.white, for: UIControlState())
        twoPlayersButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 30.0)
        twoPlayersButton.addTarget(self, action: #selector(twoPlayersTapped), for: .touchUpInside)
        
        let threePlayersButton = UIButton(frame: CGRect(x: 0, y: (screenHeight/2), width: screenWidth, height: 100))
        threePlayersButton.backgroundColor = UIColor.red
        threePlayersButton.setTitle("3 Players", for: UIControlState())
        threePlayersButton.setTitleColor(UIColor.white, for: UIControlState())
        threePlayersButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 30.0)
        threePlayersButton.addTarget(self, action: #selector(threePlayersTapped), for: .touchUpInside)

        let fourPlayersButton = UIButton(frame: CGRect(x: 0, y: (screenHeight/2) + 100, width: screenWidth, height: 100))
        fourPlayersButton.backgroundColor = UIColor.green
        fourPlayersButton.setTitle("4 Players", for: UIControlState())
        fourPlayersButton.setTitleColor(UIColor.white, for: UIControlState())
        fourPlayersButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 30.0)
        fourPlayersButton.addTarget(self, action: #selector(fourPlayersTapped), for: .touchUpInside)

        self.view.addSubview(twoPlayersButton)
        self.view.addSubview(threePlayersButton)
        self.view.addSubview(fourPlayersButton)
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate!
        appDelegate.mpcHandler.setupPeerWithDisplayName(displayName: UIDevice.current.name)
        appDelegate.mpcHandler.setupSession()
        appDelegate.mpcHandler.advertiseSelf(advertise: true)
        
        NotificationCenter.default.addObserver(self, selector: "peerChangedStateWithNotification", name: NSNotification.Name(rawValue: "MPC_DidChangeStateNotification"), object: nil)
        NotificationCenter.default.addObserver(self, selector: "handleReceivedDataWithNotification", name: NSNotification.Name(rawValue: "MPC_DidChangeStateNotification"), object: nil)
        
    }
    
    func twoPlayersTapped(_ sender: UIButton!) {
        print("2 Players selected")
        numberOfPlayers = 2
        self.performSegue(withIdentifier: "GameViewController", sender: self)
    }
    
    func threePlayersTapped(_ sender: UIButton!) {
        print("3 Players selected")
        numberOfPlayers = 3
        self.performSegue(withIdentifier: "GameViewController", sender: self)
    }
    
    func fourPlayersTapped(_ sender: UIButton!) {
        print("4 Players selected")
        numberOfPlayers = 4
        self.performSegue(withIdentifier: "GameViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! GameViewController
        destinationVC.numberOfPlayers = numberOfPlayers
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        appDelegate.mpcHandler.browser.dismiss(animated: true, completion: nil)
    }
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        appDelegate.mpcHandler.browser.dismiss(animated: true, completion: nil)
    }

    func peerChangedStateWithNotification(notification: NSNotification) {
        let userInfo = NSDictionary(dictionary: notification.userInfo!)
        
        let state = userInfo.object(forKey: "state") as! Int
        
        if state != MCSessionState.connecting.rawValue {
            self.navigationItem.title = "Connected"
        }
        
    }
    
    func handleReceivedDataWithNotification(notification: NSNotification) {
        
    }
    
    @IBAction func connectWithPlayer(_ sender: AnyObject) {
        if appDelegate.mpcHandler.session != nil {
            appDelegate.mpcHandler.setupBrowser()
            appDelegate.mpcHandler.browser.delegate = self
            
            self.present(appDelegate.mpcHandler.browser, animated: true, completion: nil)
        }
    }
}

