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

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if (FBSDKAccessToken.currentAccessToken() != nil)
//        {
//            // User is already logged in, do work such as go to next view controller.
//        }
//        else
//        {
//            let loginView : FBSDKLoginButton = FBSDKLoginButton()
//            self.view.addSubview(loginView)
//            loginView.center = self.view.center
//            loginView.readPermissions = ["public_profile", "email", "user_friends"]
//            loginView.delegate = self
//        }
//        
//        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
//            if (session != nil) {
//                print("signed in as \(session!.userName)");
//            } else {
//                print("error: \(error!.localizedDescription)");
//            }
//        })
//        
//        logInButton.center = self.view.center
//        self.view.addSubview(logInButton)
//        
//        Twitter.sharedInstance().logInWithCompletion { session, error in
//            if (session != nil) {
//                print("signed in as \(session!.userName)");
//            } else {
//                print("error: \(error!.localizedDescription)");
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
}

