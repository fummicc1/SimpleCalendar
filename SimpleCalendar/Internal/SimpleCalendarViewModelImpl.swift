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
    
    typealias Item = SimpleCalendarItemImpl
    
    @Published var beginWith: DayOfTheWeek
    @Published var numberOfWeeks: Int
    @Published var numberOfDaysPerWeek: Int
    @Published var columnCount: Int
    @Published var shouldBeyondMonth: Bool
    @Published var days: [Item]
    
    private let model: CalendarModel = CalendarModel()
    
    @Published var heads: [String] = ["月", "火", "水", "木", "金", "土", "日"]
    
    @Published var monthOfDisplay: Int
    @Published var yearOfDisplay: Int
    @Published var startDate: Date
    @Published var endDate: Date
    
    init(
        beginWith: DayOfTheWeek = DayOfTheWeek.sunday,
        columnCount: Int = 7,
        shouldBeyondMonth: Bool = true,
        startDate: Date,
        endDate: Date,
        initialPositionDate: Date
    ) {
        self.beginWith = beginWith
        self.columnCount = columnCount
        self.shouldBeyondMonth = shouldBeyondMonth
        self.startDate = startDate
        self.endDate = endDate
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: initialPositionDate)
        
        monthOfDisplay = components.month ?? 1
        yearOfDisplay = components.year ?? 2020
        
        // TODO: insert all days of initialPositionDate's month.
        days = []
        
        // TODO: get accurate values from model
        numberOfDaysPerWeek = 7
        numberOfWeeks = 4
    }
}
