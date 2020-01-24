//
//  SignUpViewController.swift
//  FRC App
//
//  Created by Gurman Brar on 2020-01-23.
//  Copyright © 2020 Gurman Brar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
        addGradientToView(view: self.view)
        touchButtonStyling(button: signUpButton)
    }
    
    func setUpElements(){
        
        errorLabel.alpha = 0
        
        
    }



    // This function checks the input fields and validates the data through firebase. If it is correct then it returns a null or if there is an error it will return it as a string
    
     func validateFields() -> String? {
        
        //Check that all fields are actually filled in
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all the fields"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password contains at least 8 characters, contains a special character and a number"
        }
        
        let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isValidEmail(cleanedEmail) == false {
            return "Please enter a valid email address"
        }
        return nil;
    }
    
    
    
    
    //Check if the password is secure enough
    
    func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    
    
    //Check if the email is in the proper format
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    // Method that changes the error label to show an error message
    func showError(_ errorMessage: String){
        errorLabel.text = errorMessage
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
      let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
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
    
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        
        // Check to see if there was an error with the fields
       if error != nil {
                  showError(error!)
       }
       else{
            // Create cleaned versions of the data
            
            let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email!, password: password!) { (result, err) in
                
                // Check for errors
                
                if err != nil{
                    
                    // there was an error
                    self.showError("Error creating user")
                }
                else{
                    
                    //The user was created sucesfully, now store first and last name
                    
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["first_name": firstName!, "last_name": lastName!, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            // show error
                            
                            self.showError("Information not stored")
                        }
                    }
                    
                    // Transition to the home screen once user has been created.
                    self.transitionToHome()
                }
            }
                   
            // Transition to the home screen
        }
    }
    
    
    
}
