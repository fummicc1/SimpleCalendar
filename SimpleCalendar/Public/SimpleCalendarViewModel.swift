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
    var columnCount: Int { get }
    var heads: [SimpleCalendarItem] { get }
}
