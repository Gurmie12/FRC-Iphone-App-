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
        addGradientToView(view: self.view)
        touchButtonStyling(button: loginButton)
    }
        
    func setUpElements(){
        errorTextFIeld.alpha = 0
    }

    
    func transitionToHome(){
           
         let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
           
           view.window?.rootViewController = homeViewController
           view.window?.makeKeyAndVisible()
       }
    
    func validateFields() -> String? {
        
        //Check that all fields are actually filled in
        
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all the fields"
        }
        
        let cleanedEmail = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isValidEmail(cleanedEmail) == false {
            return "Please enter a valid email address"
        }
        return nil;
    }
    

    //Check if the email is in the proper format
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
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
    
    func addGradientToView(view: UIView)
    {
            //gradient layer
            let gradientLayer = CAGradientLayer()
            
            //define colors
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
            
        gradientLayer.locations = [0, 0.8]
        
            //define frame
            gradientLayer.frame = view.bounds
            
            //insert the gradient layer to the view layer
            view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    func touchButtonStyling(button: UIButton){
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    
    
    
}
