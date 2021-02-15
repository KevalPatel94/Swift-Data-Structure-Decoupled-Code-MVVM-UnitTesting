//
//  MockEvents+MockDates.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

@testable import Scheduler
import Foundation

// MARK: - MockDates
struct MockDates {
    static let firstStartDate = Date(timeIntervalSince1970: 1528663500000)
    static let firstEndDate = Date(timeIntervalSince1970: 1528666200000)
    static let secondStartDate = Date(timeIntervalSince1970: 1528615800000)
    static let secondEndDate = Date(timeIntervalSince1970: 1528687800000)
    static let thirdStartDate = Date(timeIntervalSince1970: 1528678800000)
    static let thirdEndDate = Date(timeIntervalSince1970: 1528682400000)
    static let fourthStartDate = Date(timeIntervalSince1970: 1525897800000)
    static let fourthEndDate = Date(timeIntervalSince1970: 1525901400000)
}


// MARK: - MockEvents
struct MockEvents {
    static let events: [Event] = [firstEvent, secondEvent, thirdEvent, fourthEvent]
    static let sortedEvents: [Event] = [fourthEvent, secondEvent, firstEvent, thirdEvent]
    static let failureEvents: [Event] = [secondEvent, firstEvent, fourthEvent, firstEvent]
    static let conflictSuccessBooleanArray: [Bool] = [false, true, true, true]
    static let conflictFailuresBooleanArray: [Bool] = [true, false, false, false]


    static let firstEvent = Event(title: "Dentist Appointment",
                           startTime: MockDates.firstStartDate,
                           endTime: MockDates.firstEndDate,
                           _isItersectingEvent: false,
                           _extendedEndTime: nil)
    static let secondEvent = Event(title: "Birthday Party",
                           startTime: MockDates.secondStartDate,
                           endTime: MockDates.secondEndDate,
                           _isItersectingEvent: false,
                           _extendedEndTime: nil)
    static let thirdEvent = Event(title: "Evening Picnic",
                           startTime: MockDates.thirdStartDate,
                           endTime: MockDates.thirdEndDate,
                           _isItersectingEvent: false,
                           _extendedEndTime: nil)
    static let fourthEvent = Event(title: "Lunch Meeting",
                           startTime: MockDates.fourthStartDate,
                           endTime: MockDates.fourthEndDate,
                           _isItersectingEvent: false,
                           _extendedEndTime: nil)
}
