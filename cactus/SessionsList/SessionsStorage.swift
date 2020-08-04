//
//  SessionsStorage.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 8/4/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

class SessionsStorage {
    static let shared = SessionsStorage()
    
    var sessions = [Session]()
    
    func add(session: Session) {
        sessions.append(session)
    }
}
