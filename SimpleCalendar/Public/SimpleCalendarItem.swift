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
    var date: Date { get }
    var text: String { get }
    var image: Image? { get }
}
