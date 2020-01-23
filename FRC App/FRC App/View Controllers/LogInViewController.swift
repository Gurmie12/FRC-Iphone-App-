//
//  LogInViewController.swift
//  FRC App
//
//  Created by Gurman Brar on 2020-01-23.
//  Copyright © 2020 Gurman Brar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorTextFIeld: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
        
    func setUpElements(){
        errorTextFIeld.alpha = 0
    }

    
    func transitionToHome(){
           
         let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
           
           view.window?.rootViewController = homeViewController
           view.window?.makeKeyAndVisible()
       }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        // Validate the text fields
        
        // Create Cleaned version of text fields
        
        let email = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        
        Auth.auth().signIn(withEmail: email!, password: password!) { (result, error) in
            
            if error != nil{
                
                // Couldnt sign in
                self.errorTextFIeld.text = "Password or email invalid"
                self.errorTextFIeld.alpha = 1
            }
            else {
                // User has signed in succesfuly and we want to redirect to home screen
                
                self.transitionToHome()
                
            }
        }
        
    }
    
}
