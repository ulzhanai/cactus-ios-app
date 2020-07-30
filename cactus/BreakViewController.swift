//
//  BreakViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 7/29/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class BreakViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, BreakManagerDelegate {

    @IBOutlet var cactusViewImage: UIImageView!
    @IBOutlet var breakButtonView: UIButton!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var countDownLabel: UILabel!
    @IBOutlet var finishButton: UIButton!
        
    lazy var breakManager = BreakManager(breakDelegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        cactusViewImage.layer.cornerRadius = cactusViewImage.frame.width/2
        cactusViewImage.layer.masksToBounds = true
        
        breakButtonView.layer.cornerRadius = 14
        breakButtonView.layer.masksToBounds = true
        
        finishButton.layer.cornerRadius = 14
        finishButton.layer.masksToBounds = true
        finishButton.layer.borderWidth = 1
        finishButton.layer.borderColor = UIColor(named: "darkGrey")?.cgColor
        
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }

    
    @IBAction func didCloseButton() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapTakeaBreakButton() {
        let selectedPickerRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedPickerRow]
        
        //not turning into seconds
        let breakInst = Break(durationInSeconds: selectedDuration)
        breakManager.startBreak(breakInst: breakInst)
    }
    
    @IBAction func didTapFinishButton() {
        breakManager.cancelBreak()
    }
    
    
   let durations = [5, 10, 15, 20, 25, 30]
   
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
   }
   
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return durations.count
   }
   
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return "\(durations[row]) mins"
   }
    
    func showBreakStarted() {
        pickerView.isHidden = true
        breakButtonView.isHidden = true
        countDownLabel.isHidden = false
        finishButton.isHidden = false
        
        print("Break started")
    }
    
    func showTimeLeft(secondsLeft: Int) {
        countDownLabel.text = String(format: "%02d:%02d", secondsLeft / 60, secondsLeft % 60)
        print("\(secondsLeft)")
    }
    
    func showBreakEnded() {
        pickerView.isHidden = false
        breakButtonView.isHidden = false
        countDownLabel.isHidden = true
        finishButton.isHidden = true
        
        print("Break ended")
    }
     
    func showBreakCanceled() {
        pickerView.isHidden = false
        breakButtonView.isHidden = false
        countDownLabel.isHidden = true
        finishButton.isHidden = true
        
        print("Break canceled")
    }
    
}
