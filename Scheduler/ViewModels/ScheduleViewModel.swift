//
//  SchedulerViewModel.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import Foundation

class SchedulerViewModel {
    let eventManager = EventManager.shared
    var chronologicallySortedEvents: [[Event]] = [[]]
    var SchedulerError: SchedulerError? = nil
    
    init() {
        eventManager.getMeetingList(expectingReturnType: [Event].self) {[weak self] (result) in
            switch result {
            case .success(let events):
                // We can use any algorithm for sorting.
                // This will give timecompleity of O(n log n)
                let binarySortedEvents = MergeSort(events: events).sortedEvents
                // This will give timecompleity of O(n log n)
                let _ = EventTree(events: events).sortedEvents
                // This will give events with isItersectingEvent values assigned in Event model
                let allEventList = Conflict(sortedEvents: binarySortedEvents).allEventList
                self?.chronologicallySortedEvents = self?.sectionOrderedEvents(allEvents: allEventList) ?? [[]]
            case .failure(let SchedulerError):
                self?.SchedulerError = SchedulerError
            }
        }
    }
    
    /// sectionOrderedEvents method generates 2D array of section wise events.
    ///  Section are generated based on headerTitle.
    ///  Time Complexity: O(n)
    /// - Parameters:
    ///     - allEvents: [Event]
    /// - Returns: [[Event]]
    private func sectionOrderedEvents(allEvents: [Event]) -> [[Event]] {
        var resultArray: [[Event]] = [[]]
        guard let firstElement = allEvents.first else {
            return resultArray
        }
        var currentStartDate: String = firstElement.headerTitle
        var rowArray: [Event] = []
        
        for index in 0..<allEvents.count {
            if index == 0 {
                resultArray.removeAll()
            }
            let event = allEvents[index]
            if currentStartDate != event.headerTitle {
                currentStartDate = event.headerTitle
                resultArray.append(rowArray)
                rowArray.removeAll()
                rowArray.append(event)
            }
            else if currentStartDate == event.headerTitle {
                rowArray.append(event)
            }
        }
        resultArray.append(rowArray)
        return resultArray
    }
}
