//
//  Leader.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

class Leader {
    
    //let hoursCount: Int
    
    let name: String
    let about: String
    let daysCount: Int
    let sessionsCount: Int
    let totalFocusTimeInMinutes: Int
    
    init(name: String, about: String, daysCount: Int, sessionsCount: Int, totalFocusTimeInMinutes: Int) {
        self.name = name
        self.about = about
        self.daysCount = daysCount
        self.sessionsCount = sessionsCount
        self.totalFocusTimeInMinutes = totalFocusTimeInMinutes
    }
    
}
