//
//  Session.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 7/30/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

class Session {
    let durationInSeconds: Int
    let startDate: Date
    let boughtCactus: Cactus
    
    init(durationInSeconds: Int, startDate: Date, boughtCactus: Cactus) {
        self.durationInSeconds = durationInSeconds
        self.startDate = startDate
        self.boughtCactus = boughtCactus
    }
}

