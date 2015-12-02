//
//  MyCodeViewController.swift
//  QuikLink
//
//  Created by Mitali Chandna on 2015-11-28.
//  Copyright © 2015 Mitali Chandna. All rights reserved.
//

import UIKit

class MyCodeViewController: UIViewController {

    //MARK: Variables
    @IBOutlet weak var myCodeImage: UIImageView!
    @IBOutlet weak var configureButton: UIBarButtonItem!
    @IBOutlet weak var backFromMyCodeButton: UIBarButtonItem!
    
    
    //MARK: Actions
    @IBAction func configureButtonAction(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("goToConfig", sender: self)
    }
    
    @IBAction func backFromMyCodeButtonAction(sender: UIBarButtonItem) {
    dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCodeImage.image = UserModel.sharedInstance.qrCodeImage
        // Do any additional setup after loading the view, typically from a nib.
    }
}
