//
//  OnboardingViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/2/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let onboardingLabelTexts = ["Welcome \nto the \nCactus app!",
                                "Choose \ncactus \nto plant.",
                                "Stay focused \n& productive!"]
    let onboardingImageNames = ["reading side",
                                "plant",
                                "zombieing"]
    let onboardingButtonNames = ["Next",
                                 "Next",
                                 "Start"]
    var onboardingScreenNum: Int = 0
    
    
    @IBOutlet var onboardingLabel: UILabel!
    @IBOutlet var onboardingImage: UIImageView!
    @IBOutlet var onboardingButton: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        onboardingButton.layer.cornerRadius = 14
        onboardingButton.layer.masksToBounds = true
        
    }
    
    @IBAction func didTapNextOrStartButton() {
        onboardingScreenNum += 1
        
        if onboardingScreenNum < 3 {
            print(onboardingScreenNum)
            onboardingLabel.text = onboardingLabelTexts[onboardingScreenNum]
            onboardingImage.image = UIImage(named: onboardingImageNames[onboardingScreenNum])
            onboardingButton.setTitle(onboardingButtonNames[onboardingScreenNum], for: .normal)
        
        }else{
        
        performSegue(withIdentifier: "showSession", sender: nil)
        }
    }
    
    
    
}
