//
//  MainTabController.swift
//  FRC App
//
//  Created by Gurman Brar on 2020-01-25.
//  Copyright © 2020 Gurman Brar. All rights reserved.
//

import UIKit

class MainTabController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .orange
    }
    
}
