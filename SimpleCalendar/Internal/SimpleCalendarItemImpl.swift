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
    var state: SimpleCalendarItemState
    var date: Date
    var text: String
    var image: Image?
}
