//
//  DateComponant.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import Foundation

// MARK: - DateComponants
struct DateComponants {
    let weekDay: String
    let hour: String
    let month: String
    let minute: String
    let year: String
    let day: String
    init(inputDate: Date) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day, .year, .hour, .minute, .weekday, .quarter], from: inputDate)
        let indexOfMonth = components.month ?? 0
        month = calendar.shortMonthSymbols[indexOfMonth - 1]
        minute = String(format: "%02d", components.minute ?? 0)
        year = "\(components.year ?? 0)"
        day =  String(format: "%d", components.day ?? 0)
        let indexOfWeekDay = components.weekday ?? 0
        weekDay = calendar.standaloneWeekdaySymbols[indexOfWeekDay - 1]
        hour =  String(format: "%02d", components.hour ?? 0)
    }
    
}
