//
//  SimpleCalendarEvent.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2021/04/29.
//

import Foundation

public protocol SimpleCalendarEvent {
    var startDate: Date { get set }
    var endDate: Date { get set }
    var includeTime: Bool { get }
    var isAllDay: Bool { get }
    var text: String { get }
    var edited: SimpleCalendarEvent? { get }
    
    func makeEditable() -> Self
    func commitEditing()
}
