//
//  ConfigViewController.swift
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

class ConfigViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    public var GLOBALID: String = ""
    var qrCodeImage: CIImage!
    var qrCode: UIImage!
    
    let facebookButton = FBSDKLoginButton()
    let twitterButton = TWTRLogInButton(logInCompletion: { session, error in
        if (session != nil) {
            print("signed in as \(session!.userName)");
        } else {
            print("error: \(error!.localizedDescription)");
        }
    })
    
    @IBOutlet weak var backFromConfigButton: UIBarButtonItem!
//    @IBOutlet weak var facebookButton: FBSDKLoginButton!
//    @IBOutlet weak var twitterButton: TWTRLogInButton!
//    @IBOutlet weak var instagramButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ButtonForming()
    }
    
    //MARK: Actions
    @IBAction func facebookButtonActions(sender: AnyObject) {
    }
    
    //MARK: Button forming functions 
    
    func ButtonForming() {

        facebookButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.view.addSubview(facebookButton)
        var facebook_X_Position:CGFloat? = 10.0 //use your X position here
        var facebook_Y_Position:CGFloat? = 75.0 //use your Y position here
        
        facebookButton.frame = CGRectMake(facebook_X_Position!, facebook_Y_Position!, facebookButton.frame.width, facebookButton.frame.height)
        facebookButton.delegate = self
        
        self.view.addSubview(twitterButton)
        var twitter_X_Position:CGFloat? = 10.0 //use your X position here
        var twitter_Y_Position:CGFloat? = 75.0 + facebookButton.frame.height + 10.0 //use your Y position here
        
        twitterButton.frame = CGRectMake(twitter_X_Position!, twitter_Y_Position!, twitterButton.frame.width, twitterButton.frame.height)


    }
    
    //MARK: Facebook delegate methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                print("User Email is: \(userEmail)")
            }
        })
    }
    
    @IBAction func backFromConfigButtonAction(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender:AnyObject?)
    {
        if let destViewController = segue.destinationViewController as? MyCodeViewController {
            destViewController.myCodeImage.image = UserModel.sharedInstance.qrCodeImage
        }
        
        //destViewController.myCodeImage.image = qrCode
    }
    
    //MARK: NSCoding
    
    
    func ContactProfile() {
        
    }
}
