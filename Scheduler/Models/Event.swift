//
//  Event.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import Foundation
import UIKit

// MARK: - Event
struct Event: Codable, Equatable {
    public let title: String
    public let startTime: Date
    public let endTime: Date
    var _isItersectingEvent: Bool = false
    var _extendedEndTime: Date? = nil

    enum CodingKeys: String, CodingKey {
        case title
        case startTime = "start"
        case endTime   = "end"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        startTime = try container.decode(Date.self, forKey: .startTime)
        endTime = try container.decode(Date.self, forKey: .endTime)
    }
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        return lhs.interval == rhs.interval
    }
    
    // Use for mocking purpose only
    public init(title: String, startTime: Date, endTime: Date, _isItersectingEvent: Bool = false,_extendedEndTime: Date?) {
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self._isItersectingEvent = isItersectingEvent
        self._extendedEndTime = extendedEndTime
    }
}
