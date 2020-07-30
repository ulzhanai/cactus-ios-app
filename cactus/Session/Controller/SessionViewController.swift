//
//  SessionViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 7/29/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, SessionManagerDelegate {
    @IBOutlet var cactusImageView: UIImageView!
    @IBOutlet var plantButtonView: UIButton!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var countDownLabel: UILabel!
    @IBOutlet var giveUpButton: UIButton!
    
    
   lazy var sessionManager = SessionManager(sessionDelegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cactusImageView.layer.cornerRadius = cactusImageView.frame.width/2
        cactusImageView.layer.masksToBounds = true
        
        plantButtonView.layer.cornerRadius = 14
        plantButtonView.layer.masksToBounds = true
        
        giveUpButton.layer.cornerRadius = 14
        giveUpButton.layer.masksToBounds = true
        giveUpButton.layer.borderWidth = 1
        giveUpButton.layer.borderColor = UIColor(named: "darkGrey")?.cgColor
        
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }


    @IBAction func didTapPlantButton() {
        let selectedPickerRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedPickerRow]
        
        //not turning into seconds
        let session = Session(durationInSeconds: selectedDuration)
        sessionManager.startSession(session: session)
    }
    

    @IBAction func didTapGiveUpButton() {
        sessionManager.cancelSession()
    }
    
    
    //PickerDataSource/Delegate
    
    let durations = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(durations[row]) mins"
    }
  
    //SessionManagerDelegate
    func showSessionStarted() {
        pickerView.isHidden = true
        plantButtonView.isHidden = true
        countDownLabel.isHidden = false
        giveUpButton.isHidden = false
    }
    
    func showTimeLeft(secondsLeft: Int) {
        countDownLabel.text = String(format: "%02d:%02d", secondsLeft / 60, secondsLeft % 60)
        print("\(secondsLeft)")
    }
    
    func showSessionEnded() {
        performSegue(withIdentifier: "showBreak", sender: nil)
        pickerView.isHidden = false
        plantButtonView.isHidden = false
        countDownLabel.isHidden = true
        giveUpButton.isHidden = true
    }
    
    func showUserCancelledSession() {
        pickerView.isHidden = false
        plantButtonView.isHidden = false
        countDownLabel.isHidden = true
        giveUpButton.isHidden = true
    }
    
}
