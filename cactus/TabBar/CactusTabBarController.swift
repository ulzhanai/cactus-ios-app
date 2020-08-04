//
//  CactusTabBarController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class CactusTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tabBar.tintColor = UIColor(named: "secondaryColor")
        tabBar.unselectedItemTintColor = UIColor(named: "lightGrey")
        
    }
  
}
