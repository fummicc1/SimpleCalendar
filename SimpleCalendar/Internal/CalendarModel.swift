//
//  CalendarModel.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2021/04/29.
//

import Foundation

class CalendarModel {
    private var calendar: Calendar
    
    init(calendar: Calendar = Calendar.autoupdatingCurrent) {
        self.calendar = calendar
    }
    
    func getDays(of month: Month) -> [Day] {
    
        let monthNumber = month.monthOfTheYear.number
        let year = month.year
        
        return []
    }
}
