//
//  BreakManager.swift
//  cactus
//
//  Created by Ulzhan Bissarinova on 7/30/20.
//  Copyright © 2020 Ulzhan Bissarinova. All rights reserved.
//

import Foundation

protocol BreakManagerDelegate {
    func showBreakStarted()
    func showTimeLeft(secondsLeft: Int)
    func showBreakEnded()
    func showBreakCanceled()
}

class BreakManager {
    var breakDelegate: BreakManagerDelegate
    var timer: Timer?
    
    init(breakDelegate: BreakManagerDelegate) {
        self.breakDelegate = breakDelegate
    }
    
    func startBreak(breakInst: Break) {
        breakDelegate.showBreakStarted()
        breakDelegate.showTimeLeft(secondsLeft: breakInst.durationInSeconds)
        
        var secondsLeft = breakInst.durationInSeconds
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            secondsLeft -= 1
            self.breakDelegate.showTimeLeft(secondsLeft: secondsLeft)
            
            if secondsLeft == 0 {
                self.breakDelegate.showBreakEnded()
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }
    
    func cancelBreak(){
        breakDelegate.showBreakCanceled()
        self.timer?.invalidate()
        self.timer = nil
    }
}


