//
//  LeadersStorage.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

class LeadersStorage {
    static let shared = LeadersStorage()

    let leaders = [Leader(name: "Konstantin Konstantinopolsky", hoursCount: 250),
                   Leader(name: "Cody Fisher", hoursCount: 240),
                   Leader(name: "Kristin Watson", hoursCount: 200),
                   Leader(name: "Dianne Russell", hoursCount: 180),
                   Leader(name: "Albert Flores", hoursCount: 100),
                   Leader(name: "Jack White", hoursCount: 90),
                   Leader(name: "Bob Grey", hoursCount: 80),
                   Leader(name: "Johnathan Livingstone", hoursCount: 70),
                   Leader(name: "Madilyn Hill", hoursCount: 60)]
}
