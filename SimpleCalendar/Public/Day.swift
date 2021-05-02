//
//  Day.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2021/04/29.
//

import Foundation

public struct Day {
    var date: Date
    var dayOfTheWeek: DayOfTheWeek
    var month: Month
}

public enum DayOfTheWeek: Int {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    public func next() -> Self {
        switch self {
        case .sunday:
            return .monday
        case .monday:
            return .tuesday
            
        case .tuesday:
            return .wednesday
        case .wednesday:
            return .thursday
        case .thursday:
            return .friday
        case .friday:
            return .saturday
        case .saturday:
            return .sunday
        }
    }
}
