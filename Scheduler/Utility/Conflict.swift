//
//  Conflict.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import Foundation

// MARK: - Conflict
struct Conflict {
    // output Event array
    var allEventList: [Event] = []
    init(sortedEvents: [Event]) {
        self.allEventList = conflictFinder(events: sortedEvents)
    }
    
    /// conflictFinder update the value of isItersectingEvent in Event model for each event and return the array of events.
    /// TimeComplexity: O(n)
    /// - Parameters:
    ///     - events: [Event]
    /// - Returns: [Event]
    private func conflictFinder(events: [Event]) -> [Event] {
        var allEvents = events
        for index in 0..<(events.count - 1) {
            let current = allEvents[index]
            let next = allEvents[index + 1]
            let currentExtendedEndTime = current.extendedEndTime ?? current.endTime
            let isIntersecting = currentExtendedEndTime > next.startTime
            if isIntersecting {
                allEvents[index].isItersectingEvent = true
                allEvents[index + 1].isItersectingEvent = true
            }
            if current.endTime > next.endTime || currentExtendedEndTime > next.endTime {
                allEvents[index + 1].extendedEndTime = currentExtendedEndTime
            }
        }
        return allEvents
    }
}
