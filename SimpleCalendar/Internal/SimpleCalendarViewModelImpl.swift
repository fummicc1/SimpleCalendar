//
//  SimpleCalendarViewModelImpl.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2020/10/30.
//

import Foundation
import SwiftUI
import Combine

class SimpleCalendarViewModelImpl: SimpleCalendarViewModel {
    var columnCount: Int = 7
    
    private let calendar: Calendar = .init(identifier: .gregorian)
    
    var headColumns: [SimpleCalendarItem] = (0...6).map { index in
        SimpleCalendarItemImpl(date: Date(), text: "\(index)", image: nil)
    }
}
