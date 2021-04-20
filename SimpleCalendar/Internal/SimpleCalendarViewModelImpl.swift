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
    @Published var columnCount: Int
    
    private let calendar: Calendar = .init(identifier: .gregorian)
    
    @Published var heads: [SimpleCalendarItem] = (0...6).map { index in
        let current = Date()
        let calendar = Calendar(identifier: .gregorian)
        var components = calendar.dateComponents([.year, .month, .day], from: current)
        var day = components.day ?? 0
        day = day + index
        components.day = day
        let date = calendar.date(byAdding: components, to: current) ?? current
        return SimpleCalendarItemImpl(
            state: SimpleCalendarItemStateImpl(
                date: date,
                isSelected: index == 0,
                isToday: false
            ),
            date: date,
            text: "\(index)",
            image: nil
        )
    }
    
    @Published var monthOfDisplay: Int
    @Published var yearOfDisplay: Int
    @Published var startDate: Date
    @Published var endDate: Date
    
    init(
        columnCount: Int = 7,
        startDate: Date,
        endDate: Date,
        initialPositionDate: Date
    ) {
        self.columnCount = columnCount
        self.startDate = startDate
        self.endDate = endDate
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: initialPositionDate)
        
        monthOfDisplay = components.month ?? 1
        yearOfDisplay = components.year ?? 2020
    }
}
