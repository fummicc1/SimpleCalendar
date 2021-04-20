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
    var state: SimpleCalendarItemState { get }
    var date: Date { get }
    var text: String { get }
    var image: Image? { get }
}
