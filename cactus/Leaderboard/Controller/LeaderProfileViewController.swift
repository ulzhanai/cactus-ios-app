//
//  LeaderProfileViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/16/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class LeaderProfileViewController: UIViewController {
    var leader: Leader!
    @IBOutlet var leaderNameLabel: UILabel!
    @IBOutlet var aboutLabel: UILabel!
    @IBOutlet var daysCountLabel: UILabel!
    @IBOutlet var sessionsCountLabel: UILabel!
    @IBOutlet var totalFocusTimeLabel: UILabel!
    
    @IBOutlet var sessionCountView: UIView!
    @IBOutlet var totalFocusTimeView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sessionCountView.layer.cornerRadius = 16
        sessionCountView.layer.masksToBounds = true
        
        totalFocusTimeView.layer.cornerRadius = 16
        totalFocusTimeView.layer.masksToBounds = true
        
        leaderNameLabel.text = leader.name
        aboutLabel.text = leader.about
        daysCountLabel.text = "\(leader.statistics.daysCount) days with cactus"
        sessionsCountLabel.text = "\(leader.statistics.sessionsCount)"
        totalFocusTimeLabel.text = "\(leader.statistics.totalFocusTimeInMinutes/60)h \(leader.statistics.totalFocusTimeInMinutes%60)m"
        
        
    }

}
