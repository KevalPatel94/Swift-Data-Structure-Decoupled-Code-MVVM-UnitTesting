//
//  EventTreeTests.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import XCTest
@testable import Scheduler
 
class EventTreeTests: XCTestCase {

    let eventTree = EventTree(events: MockEvents.events)

    func testMergeSortedSuccessCase() throws {
        let sortedEvents = eventTree.sortedEvents
        let expectedSortedEvents = MockEvents.sortedEvents
        for index in 0..<sortedEvents.count {
            XCTAssertEqual(sortedEvents[index], expectedSortedEvents[index])
        }
    }
    
    func testMergeSortedFailureCase() throws {
        let sortedEvents = eventTree.sortedEvents
        let expectedSortedEvents = MockEvents.failureEvents
        for index in 0..<sortedEvents.count {
            XCTAssertNotEqual(sortedEvents[index], expectedSortedEvents[index])
        }
    }

}

