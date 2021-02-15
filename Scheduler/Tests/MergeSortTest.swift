//
//  MergeSortTest.swift
//  SchedulerTests
//
//  Created by Keval Patel on 1/18/21.
//

import XCTest
@testable import Scheduler
 
class MergeSortTests: XCTestCase {

    let mergeSort = MergeSort(events: MockEvents.events)

    func testMergeSortedSuccessCase() throws {
        let sortedEvents = mergeSort.sortedEvents
        let expectedSortedEvents = MockEvents.sortedEvents
        for index in 0..<sortedEvents.count {
            XCTAssertEqual(sortedEvents[index], expectedSortedEvents[index])
        }
    }
    
    func testMergeSortedFailureCase() throws {
        let sortedEvents = mergeSort.sortedEvents
        let expectedSortedEvents = MockEvents.failureEvents
        for index in 0..<sortedEvents.count {
            XCTAssertNotEqual(sortedEvents[index], expectedSortedEvents[index])
        }
    }

}
