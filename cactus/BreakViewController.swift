//
//  BreakViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 7/29/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class BreakViewController: UIViewController {

    @IBOutlet var cactusViewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cactusViewImage.layer.cornerRadius = cactusViewImage.frame.width/2
    }

    
    @IBAction func didCloseButton() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
