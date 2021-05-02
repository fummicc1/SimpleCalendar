//
//  CalendarModel.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2021/04/29.
//

import Foundation

public class CalendarModel {
    
    public enum Error: Swift.Error {
        case invalidDateComponents(DateComponents)
    }
    
    private var calendar: Calendar
    
    init(calendar: Calendar = Calendar.autoupdatingCurrent) {
        self.calendar = calendar
    }
    
    func getFirstDateOfMonth(monthOfTheYear: MonthOfTheYear, year: Year) throws -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = monthOfTheYear.number
        dateComponents.day = 1
        guard let firstDate = calendar.date(from: dateComponents) else {
            throw Error.invalidDateComponents(dateComponents)
        }
        return firstDate
    }
    
    func getDaysOfMonth(month: Month) throws -> [Day] {
        let firstDate = month.firstDateOfMonth
        
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: firstDate)
        
        let currentMonth = dateComponents.month!
        
        var days: [Day] = []
        
        while currentMonth == dateComponents.month! {
            guard let date = calendar.date(from: dateComponents) else {
                throw Error.invalidDateComponents(dateComponents)
            }
            // 1 ~ 7
            let ordinary: Int = calendar.ordinality(of: .day, in: .weekOfMonth, for: date)!
            let dayOfTheWeek = DayOfTheWeek(rawValue: (ordinary - 1) % 7)!
            let day = Day(date: date, dayOfTheWeek: dayOfTheWeek, month: month)
            days.append(day)
            
            dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
            dateComponents.day! += 1
        }
        
        return days
    }
    
    func getNumberOfDaysInMonth(month: Month) -> Int {
        let range = calendar.range(of: .day, in: .month, for: month.firstDateOfMonth)
        return range?.count ?? 0
    }
}
