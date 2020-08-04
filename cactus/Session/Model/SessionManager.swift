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
    func showTimeLeftInCancelX(secondsLeft: Int)
    
    func showSessionEnded()
    func showCancelXEnded()
    func showUserCancelledSession()
}

class SessionManager {
    var sessionDelegate: SessionManagerDelegate
    var timer: Timer?
    var timerInCancelX: Timer?
    let sessionStorage = SessionsStorage()
    
    init(sessionDelegate: SessionManagerDelegate) {
        self.sessionDelegate = sessionDelegate
    }
    
    func startSession(session: Session) {
        sessionDelegate.showSessionStarted()
        sessionDelegate.showTimeLeft(secondsLeft: session.durationInSeconds)
        sessionDelegate.showTimeLeftInCancelX(secondsLeft: 10)
        
        var secondsLeft = session.durationInSeconds
        

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            secondsLeft -= 1
            self.sessionDelegate.showTimeLeft(secondsLeft: secondsLeft)
            
            if secondsLeft == 0 {
                 SessionsStorage.shared.add(session: session)
                print("session added to storage")
                 self.sessionDelegate.showSessionEnded()
                
                self.timer?.invalidate()
                self.timer = nil
            }
        }
        
        var secondsLeftInCancelX = 10
        
        timerInCancelX = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            secondsLeftInCancelX -= 1
            self.sessionDelegate.showTimeLeftInCancelX(secondsLeft: secondsLeftInCancelX)
            
            if secondsLeftInCancelX == 0{
                
                if(secondsLeft>0){ //if session is still in progress
                  self.sessionDelegate.showCancelXEnded()
                }
                else{ // if session is also ended
                    self.sessionDelegate.showSessionEnded()
                }
                
                self.timerInCancelX?.invalidate()
                self.timerInCancelX = nil
            }
            }
        
    }
    
    func cancelXSession(){
        sessionDelegate.showUserCancelledSession()
        self.timerInCancelX?.invalidate()
        self.timerInCancelX = nil
    
    }
    
    func cancelSession(){
        sessionDelegate.showUserCancelledSession()
        self.timer?.invalidate()
        self.timer = nil
    }
}
