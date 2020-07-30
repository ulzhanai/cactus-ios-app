//
//  SessionManagerDelegate.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 7/30/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

protocol SessionManagerDelegate {
    func showSessionStarted()
    func showTimeLeft(secondsLeft: Int)
    func showSessionEnded()
    func showUserCancelledSession()
    //func userCancelledSession()
}

class SessionManager {
    var sessionDelegate: SessionManagerDelegate
    var timer: Timer?
    
    init(sessionDelegate: SessionManagerDelegate) {
        self.sessionDelegate = sessionDelegate
    }
    
    func startSession(session: Session) {
        sessionDelegate.showSessionStarted()
        sessionDelegate.showTimeLeft(secondsLeft: session.durationInSeconds)
        
        var secondsLeft = session.durationInSeconds

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            secondsLeft -= 1
            self.sessionDelegate.showTimeLeft(secondsLeft: secondsLeft)
            
            if secondsLeft == 0 {
                self.sessionDelegate.showSessionEnded()
                
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }
    
    func cancelSession(){
        sessionDelegate.showUserCancelledSession()
        self.timer?.invalidate()
        self.timer = nil
    }
}
