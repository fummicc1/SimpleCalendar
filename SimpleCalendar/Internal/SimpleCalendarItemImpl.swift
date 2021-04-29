//
//  SimpleCalendarColumnsImpl.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2020/10/30.
//

import Foundation
import SwiftUI
import Combine

struct SimpleCalendarItemImpl: SimpleCalendarItem {
    
    typealias Event = SimpleCalendarEventImpl
    
    var isSelected: Bool
    var isToday: Bool
    var events: [Event]
    var day: Day
    var text: String
    var image: Image?
}
