//
//  SimpleCalendarColumns.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2020/10/30.
//

import Foundation
import SwiftUI
import Combine

public protocol SimpleCalendarItem {
    
    associatedtype Event: SimpleCalendarEvent & Hashable
    
    var isSelected: Bool { get }
    var isToday: Bool { get }
    var events: [Event] { get }
    var day: Day { get }
    var text: String { get }
    var image: Image? { get }
}
