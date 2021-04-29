//
//  SimpleCalendarViewModel.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2020/10/30.
//

import Foundation
import SwiftUI
import Combine

public protocol SimpleCalendarViewModel: ObservableObject {
    
    associatedtype Item: SimpleCalendarItem
    
    var shouldBeyondMonth: Bool { get }
    var columnCount: Int { get }
    var heads: [String] { get }
    var days: [Item] { get }
    var monthOfDisplay: Int { get }
    var yearOfDisplay: Int { get }
    var startDate: Date { get }
    var endDate: Date { get }
}
