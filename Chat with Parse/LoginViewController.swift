//
//  LoginViewController.swift
//  Chat with Parse
//
//  Created by Shumba Brown on 2/23/17.
//  Copyright © 2017 Shumba Brown. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var username: String?
    var password: String?
    var user = PFUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func usernameTextFieldDidEdit(_ sender: Any) {
        username = usernameTextField.text
    }
    @IBAction func passwordTextFieldDidEdit(_ sender: Any) {
        password = passwordTextField.text
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
            
            PFUser.logInWithUsername(inBackground: username!, password: password!, block: { (user: PFUser?, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                }
                else {
                    self.user = user!
                    print("login was successful")
                    
                    // segue to next screen
                    self.performSegue(withIdentifier: "successfulLogin", sender: self)
                }
            })
            
        }

    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
