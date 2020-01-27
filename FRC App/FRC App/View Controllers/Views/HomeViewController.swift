//
//  HomeViewController.swift
//  FRC App
//
//  Created by Gurman Brar on 2020-01-23.
//  Copyright © 2020 Gurman Brar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var tabViewControllerTransition: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func transitionButtonIsPushed(_ sender: Any) {
        
        let mainTabController = storyboard?.instantiateViewController(identifier: "MainTabController") as! MainTabController
        
        // Start the tab controller at the meetings page
        mainTabController.selectedViewController = mainTabController.viewControllers?[3]
        
        // Transfer to the tabController page if the welcome screen is clicked
        view.window?.rootViewController = mainTabController
        view.window?.makeKeyAndVisible()
        
    }
    
}
