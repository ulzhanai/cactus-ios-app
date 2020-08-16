//
//  CactusesStorage.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/10/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

class CactusesStorage {
    static let shared = CactusesStorage()
    
    let cactuses = [Cactus(imageName: "cactus_1"),
                    Cactus(imageName: "cactus_2"),
                    Cactus(imageName: "cactus_3"),
                    Cactus(imageName: "cactus_4"),
                    Cactus(imageName: "cactus_5"),
                    Cactus(imageName: "cactus_6")]
    
    var selectedCactus = Cactus(imageName: "cactus_1")
    
    func selectCactus(_ cactus: Cactus) {
        selectedCactus = cactus
    }
    
    func isCactusSelected(_ cactus: Cactus) -> Bool {
        return cactus.imageName == selectedCactus.imageName
    }
}
