//
//  SessionViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 7/29/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, SessionManagerDelegate{
   
    @IBOutlet var cactusImageView: UIImageView!
    @IBOutlet var plantButtonView: UIButton!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var countDownLabel: UILabel!
    @IBOutlet var giveUpButton: UIButton!
    @IBOutlet var cancelXButton: UIButton!
    
   lazy var sessionManager = SessionManager(sessionDelegate: self)

   // Empty vars
    var finishedSession: Session?
    
      
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(cactusWasSelected), name: NSNotification.Name("cactus_was_selected"), object: nil)
    }

    @objc func cactusWasSelected() {
        cactusImageView.image = UIImage(named: CactusesStorage.shared.selectedCactus.imageName)
            print("we've got here \(CactusesStorage.shared.selectedCactus.imageName) at Session screen")
        }

    @IBAction func didTapPlantButton() {
        let selectedPickerRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedPickerRow]
        
        //not turning into seconds
        let session = Session(durationInSeconds: selectedDuration, startDate: Date(), boughtCactus: CactusesStorage.shared.selectedCactus)
        sessionManager.startSession(session: session)
    }
    

    @IBAction func didTapGiveUpButton() {
        sessionManager.cancelSession()
    }
    
    @IBAction func didTapCancelXButton() {
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
        giveUpButton.isHidden = true
        cancelXButton.isHidden = false
    }
    
    func showTimeLeft(secondsLeft: Int) {
        countDownLabel.text = String(format: "%02d:%02d", secondsLeft / 60, secondsLeft % 60)
        print("\(secondsLeft)")
    }
    
    func showTimeLeftInCancelX(secondsLeft: Int) {
        let title = "Cancel (\(secondsLeft))"
               
               UIView.performWithoutAnimation {
                   cancelXButton.setTitle(title, for: .normal)
                   cancelXButton.layoutIfNeeded()
               }
    }
    
    func showCancelXEnded(){
        cancelXButton.isHidden = true
        giveUpButton.isHidden = false
    }
    
        
    func showSessionEnded(session: Session) {
        finishedSession = session
        
        performSegue(withIdentifier: "showBreak", sender: nil)
        pickerView.isHidden = false
        plantButtonView.isHidden = false
        countDownLabel.isHidden = true
        giveUpButton.isHidden = true
        cancelXButton.isHidden = true
    }
    
    func showUserCancelledSession() {
        pickerView.isHidden = false
        plantButtonView.isHidden = false
        countDownLabel.isHidden = true
        giveUpButton.isHidden = true
        cancelXButton.isHidden = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let breakVC = segue.destination as? BreakViewController {
            breakVC.finishedSession = finishedSession
            
        }
    }
    
}

