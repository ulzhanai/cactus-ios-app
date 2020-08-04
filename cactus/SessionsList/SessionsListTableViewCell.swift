//
//  SessionsListTableViewCell.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class SessionsListTableViewCell: UITableViewCell {
    @IBOutlet var cactusImageView: UIImageView!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        backgroundColor = .clear
        cactusImageView.layer.cornerRadius = cactusImageView.frame.width/2
        cactusImageView.layer.masksToBounds = true
    }
    
    func configure(with session: Session){
        let hoursCount = session.durationInSeconds/60
        let minutesCount = session.durationInSeconds%60
        
        var durationText:String!
        
        if hoursCount == 0 {
            durationText = "\(minutesCount%60)m"
        } else if minutesCount == 0 {
            durationText = "\(hoursCount)h"
        } else {
            durationText = "\(hoursCount)h \(minutesCount%60)m"
        }
        durationLabel.text = durationText
        
        let startDate = "\(SessionsListTableViewCell.dateFormatter.string(from: session.startDate))"
        startDateLabel.text = startDate
        
    }
}
