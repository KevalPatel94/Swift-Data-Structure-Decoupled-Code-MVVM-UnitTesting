//
//  ConflictTests.swift
//  SchedulerTests
//
//  Created by Keval Patel on 1/18/21.
//

@testable import Scheduler
import XCTest

class ConflictTests: XCTestCase {

    let conflict = Conflict(sortedEvents: MockEvents.sortedEvents)
    func testConflictSuccessCase() throws {
        let sortedWithConflictsEvents = conflict.allEventList
        let expectedSortedEvents = MockEvents.conflictSuccessBooleanArray
        for index in 0..<sortedWithConflictsEvents.count {
            XCTAssertEqual(sortedWithConflictsEvents[index].isItersectingEvent, expectedSortedEvents[index])
        }
    }
    
    func testMergeSortedFailureCase() throws {
        let sortedWithConflictsEvents = conflict.allEventList
        let expectedSortedEvents = MockEvents.conflictFailuresBooleanArray
        for index in 0..<sortedWithConflictsEvents.count {
            XCTAssertNotEqual(sortedWithConflictsEvents[index].isItersectingEvent, expectedSortedEvents[index])
        }
    }

}
