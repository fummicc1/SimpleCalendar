//
//  SimpleCalendarEventImpl.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2021/04/29.
//

import Foundation

struct SimpleCalendarEventImpl: SimpleCalendarEvent, Hashable {
    static func == (lhs: SimpleCalendarEventImpl, rhs: SimpleCalendarEventImpl) -> Bool {
        return lhs.startDate == rhs.startDate && lhs.endDate == rhs.endDate && lhs.includeTime == rhs.includeTime && lhs.isAllDay == rhs.isAllDay && lhs.text == rhs.text
    }
    
    var startDate: Date
    
    var endDate: Date
    
    var includeTime: Bool
    
    var isAllDay: Bool
    
    var text: String
    
    var edited: SimpleCalendarEvent?
    
    func makeEditable() -> SimpleCalendarEventImpl {
        self
    }
    
    func commitEditing() {
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}
