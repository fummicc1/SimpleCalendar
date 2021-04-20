//
//  SimpleCalendarItemState.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2021/04/20.
//

import Foundation

public protocol SimpleCalendarItemState {
    var date: Date { get }
    var isSelected: Bool { get }
    var isToday: Bool { get }
}
