//
//  LeaderboardTableViewCell.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    @IBOutlet var indexLabel: UILabel!
    @IBOutlet var leaderImageView: UIImageView!
    @IBOutlet var hoursCountLabel: UILabel!
    @IBOutlet var leaderNameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    func configure(with leader: Leader, index: Int){
        
        hoursCountLabel.text = "\(leader.hoursCount)"
        leaderNameLabel.text = leader.name
        
        indexLabel.text = "\(index+1)" //cause index in array starts at 0
        

        
    }

}
