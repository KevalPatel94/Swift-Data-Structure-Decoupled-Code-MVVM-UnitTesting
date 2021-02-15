//
//  Event+Utility.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import Foundation
import UIKit

// MARK: - Event
extension Event {
    private var startTimeComponant: DateComponants {
        return DateComponants(inputDate: startTime)
    }
    
    private var endTimeComponant: DateComponants {
        return DateComponants(inputDate: endTime)
    }
    
    var isItersectingEvent: Bool {
        get {
            return _isItersectingEvent
        }
        set(enable) {
            _isItersectingEvent = enable
        }
    }
    
    var extendedEndTime: Date? {
        get {
            return _extendedEndTime
        }
        set(newValue) {
            if let newEndTime = newValue {
                _extendedEndTime = newEndTime
            }
        }
    }
    
    var interval: DateInterval {
        return DateInterval(start: startTime, end: endTime)
    }
    
    var headerTitle: String {
        return "\(startTimeComponant.weekDay), \(startTimeComponant.month) \(startTimeComponant.day) \(startTimeComponant.year)"

    }
    
    var dateOfStartTime: String {
        return startTimeComponant.day
    }
    
    var weekDayOfStartTime: String {
        return startTimeComponant.weekDay
    }
    
    var startTimeString: String {
        return "Starts at: \(startTimeComponant.hour):\(startTimeComponant.minute)"
    }
    
    var endTimeString: String {
        return "Ends at:   \(endTimeComponant.hour):\(endTimeComponant.minute)"
    }
    
    var eventProfileString: String {
        return "\(title.first ?? "F")"
    }
}
