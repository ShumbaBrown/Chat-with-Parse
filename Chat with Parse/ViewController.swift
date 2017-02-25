//
//  ViewController.swift
//  Chat with Parse
//
//  Created by Shumba Brown on 2/23/17.
//  Copyright © 2017 Shumba Brown. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var username: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func usernameFieldEditingChanged(_ sender: Any) {
        username = usernameTextField.text
    }
    
    @IBAction func passwordFieldEditingChanged(_ sender: Any) {
        password = passwordTextField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func onLoginButton(_ sender: Any) {
        if username == nil {
            // Display message that the email is required
            print("Email address is required")
        }
        else if password == nil {
            // Display message that the password is required
            print("Password is required")
        }
        else {
            let user = PFUser()
            user.username = username
            user.password = password
            //user.email = "email@example.com"
            // other fields can be set just like with PFObject
            //user["phone"] = "415-392-0202"
            
            user.signUpInBackground(block: { (succeeded: Bool, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                }
                else {
                    print("Sign up Successful")
                    // segue to next screen
                }
            })
            
        }
        print("username: \(username) password: \(password)")
    }
    
    @IBAction func onSignUpButton(_ sender: Any) {
        if username == nil {
            // Display message that the email is required
            print("Email address is required")
        }
        else if password == nil {
            // Display message that the password is required
            print("Password is required")
        }
        else {
            let user = PFUser()
            user.username = username
            user.password = password
            //user.email = "email@example.com"
            // other fields can be set just like with PFObject
            //user["phone"] = "415-392-0202"
            
            user.signUpInBackground(block: { (succeeded: Bool, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                }
                else {
                    print("Sign up Successful")
                    // segue to next screen
                }
            })
            
        }
        print("username: \(username) password: \(password)")
    }



}

