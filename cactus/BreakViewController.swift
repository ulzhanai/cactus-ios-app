//
//  BreakViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 7/29/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class BreakViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func didCloseButton() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
