//
//  ViewController.swift
//  QuikLink
//
//  Created by Mitali Chandna on 2015-11-28.
//  Copyright © 2015 Mitali Chandna. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit
import TwitterKit
import Fabric

class ViewController: UIViewController {

    
    //MARK: Variables
    
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var myCodeButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let tempImage = UIImage(named: "default") {
            UserModel.sharedInstance.qrCodeImage = tempImage
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    
    @IBAction func scanButtonAction(sender: UIButton) {
        self.performSegueWithIdentifier("goToScanCode", sender: self)
    }
    
    @IBAction func myCodeButtonAction(sender: UIButton) {
        self.performSegueWithIdentifier("goToMyCode", sender: self)
    }
}
