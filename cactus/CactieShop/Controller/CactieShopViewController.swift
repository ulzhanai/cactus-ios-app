//
//  CactieShopViewController.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/10/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import UIKit

//protocol CactieShopViewControllerDelegate {
//    func cactusWasSelected()
//}

class CactieShopViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cactie Shop"
        
        collectionView.collectionViewLayout = layoutForCollectionView()
        
    }

        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return CactusesStorage.shared.cactuses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cactus_cell", for: indexPath) as! CactieShopCollectionViewCell
        
        let cactus = CactusesStorage.shared.cactuses[indexPath.row]
        
        if CactusesStorage.shared.isCactusSelected(cactus) == true {
            cell.isSelected = true
        }
        
        cell.configure(with: cactus)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selection = CactusesStorage.shared.cactuses[indexPath.row]
        CactusesStorage.shared.selectCactus(selection)
        //Update collection view data
        collectionView.reloadData()
     
        NotificationCenter.default.post(name: NSNotification.Name("cactus_was_selected"), object: self)
 
        print("clicked \(CactusesStorage.shared.selectedCactus.imageName)")
    }
    
    func layoutForCollectionView() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(199))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(199))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(23)
        
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 23, leading: 16, bottom: 16, trailing: 23)
        section.interGroupSpacing = 23
        
        return UICollectionViewCompositionalLayout(section:section)
        
    }

    
    @IBAction func closeCactieShop(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
             /*presentingViewController?.dismiss(animated: true, completion: nil)*/
    }
    
    
    //var delegate: CactieShopViewControllerDelegate?
    
//    @IBAction func didSelectCactus(_ sender: Any) {
//        //delegate?.cactusWasSelected()
//        NotificationCenter.default.post(name: NSNotification.Name("cactus_was_selected"), object: self)
//    }
    
}
