//
//  MergeSort.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import Foundation

// MARK: - MergeSort
struct MergeSort {
    var sortedEvents: [Event] = []
    init(events: [Event]) {
        self.sortedEvents = mergeSort(eventList: events)
    }
    
    /// mergeSort takes the value of event list and return thr sorted array of events.
    /// TimeComplexity: O(log n)
    /// - Parameters:
    ///     - events: [Event]
    /// - Returns: [Event]
    private func mergeSort(eventList: [Event]) -> [Event] {
        guard eventList.count > 1 else {
            return eventList
        }
        let middlePoint = eventList.count/2
        let leftArray = mergeSort(eventList: Array(eventList[..<middlePoint]))
        let rightArray = mergeSort(eventList: Array(eventList[middlePoint...]))
        return merge(left: leftArray, right: rightArray)
    }

    
    /// merge takes left and right half, and  returns sorted array.
    /// - Parameters:
    ///     - left  : [Event]
    ///     - right: [Event]
    /// - Returns: [Event]
    private func merge(left: [Event], right: [Event]) -> [Event] {
        var leftIndex = 0
        var rightIndex = 0
        var result: [Event] = []
        while leftIndex < left.count && rightIndex < right.count {
            // we can also use startdate instead of interval
            let leftInterval = left[leftIndex].interval
            let rightInterval = right[rightIndex].interval
            // if rightInterval < leftInterval, append right element to result array.
            if rightInterval < leftInterval {
                result.append(right[rightIndex])
                rightIndex += 1
            }
            // if rightInterval > leftInterval, append left element to result array.
            else if rightInterval > leftInterval {
                result.append(left[leftIndex])
                leftIndex += 1
            }
            // if rightInterval = leftInterval, append left and right element to result array.
            else {
                result.append(right[rightIndex])
                result.append(left[leftIndex])
                leftIndex += 1
                rightIndex += 1
            }
        }
        
        // Append remaining left and right half to result array.
        if leftIndex < left.count {
            result.append(contentsOf: left[leftIndex...])
        }
        if rightIndex < right.count {
            result.append(contentsOf: right[rightIndex...])
        }
        return result
    }
}
