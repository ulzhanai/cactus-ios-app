//
//  CactieShopCollectionViewCell.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/10/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

class CactieShopCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cactusCardView: UIView!
    @IBOutlet var cactusItemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cactusCardView.layer.cornerRadius = 16
        cactusCardView.layer.masksToBounds = true
        
        cactusItemImageView.layer.cornerRadius = 16
        cactusItemImageView.layer.masksToBounds = true
        
        
    }
    
    
    func configure(with cactus: Cactus){
        cactusItemImageView.image
            = UIImage(named: cactus.imageName)
        
        if self.isSelected == true {
            cactusCardView.backgroundColor = UIColor(named: "primaryColor")
        } else {
            cactusCardView.backgroundColor = UIColor(named: "secondaryBackgroundColor")
         }
    }
}
