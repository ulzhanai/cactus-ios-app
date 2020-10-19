//
//  Leader.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

class Statistics: Decodable {
    
    let daysCount: Int
    let sessionsCount: Int
    let totalFocusTimeInMinutes: Int
    
    init(daysCount: Int, sessionsCount: Int, totalFocusTimeInMinutes: Int) {
        self.daysCount = daysCount
        self.sessionsCount = sessionsCount
        self.totalFocusTimeInMinutes = totalFocusTimeInMinutes
    }
    
}

class Leader: Decodable {
    
    //let hoursCount: Int
    
    let name: String
    let about: String
    let statistics: Statistics

    
    init(name: String, about: String, statistics: Statistics) {
        self.name = name
        self.about = about
        self.statistics = statistics
    }
    
}
