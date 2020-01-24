//
//  ViewController.swift
//  FRC App
//
//  Created by Gurman Brar on 2020-01-23.
//  Copyright © 2020 Gurman Brar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientToView(view: self.view)
        touchButtonStyling(button: loginButton)
        touchButtonStyling(button: signUpButton)
        // Do any additional setup after loading the view.
    }
    
    
    func touchButtonStyling(button: UIButton){
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func addGradientToView(view: UIView)
    {
            //gradient layer
            let gradientLayer = CAGradientLayer()
            
            //define colors
        gradientLayer.colors = [UIColor.white.cgColor,UIColor.blue.cgColor, UIColor.blue.cgColor]
            
        gradientLayer.locations = [0, 0.6, 0.8]
        
            //define frame
            gradientLayer.frame = view.bounds
            
            //insert the gradient layer to the view layer
            view.layer.insertSublayer(gradientLayer, at: 0)
    }

}

