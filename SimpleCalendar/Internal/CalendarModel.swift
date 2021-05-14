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
    
    private(set) public var events: [SimpleCalendarEvent] = []
    
    init(calendar: Calendar = Calendar.autoupdatingCurrent) {
        self.calendar = calendar
    }
    
    func getFirstDateInMonth(monthOfTheYear: MonthOfTheYear, year: Year) throws -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = monthOfTheYear.number
        dateComponents.day = 1
        guard let firstDate = calendar.date(from: dateComponents) else {
            throw Error.invalidDateComponents(dateComponents)
        }
        return firstDate
    }
    
    func getItems(of month: Month, daysPerWeek: Int = 7, weeks: Int) throws -> [SimpleCalendarItemImpl] {
        []
    }
    
    func getDays(of month: Month) throws -> [Day] {
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
    
    func getNumberOfDays(in month: Month) -> Int {
        let range = calendar.range(of: .day, in: .month, for: month.firstDateOfMonth)
        return range?.count ?? 0
    }
    
    func forward(from base: Month) -> Month {
        var next = base
        let currentFirstDate = base.firstDateOfMonth
        var component = calendar.dateComponents([.year, .month, .day], from: currentFirstDate)
        component.month? += 1
        if let nextFirstDate = component.date, let month = component.month, let year = component.year {
            next.firstDateOfMonth = nextFirstDate
            next.monthOfTheYear = MonthOfTheYear(rawValue: month - 1)!
            next.year = year
        }
        return next
    }
    
    func backward(from base: Month) -> Month {
        var next = base
        let currentFirstDate = base.firstDateOfMonth
        var component = calendar.dateComponents([.year, .month, .day], from: currentFirstDate)
        component.month? -= 1
        if let nextFirstDate = component.date, let month = component.month, let year = component.year {
            next.firstDateOfMonth = nextFirstDate
            next.monthOfTheYear = MonthOfTheYear(rawValue: month - 1)!
            next.year = year
        }
        return next
    }
    
    func convert(
        date: Date,
        calendar: Calendar = .autoupdatingCurrent
    ) throws -> Day {
        let component = calendar.dateComponents([.year, .month, .day, .weekday], from: date)
        guard let weekDayNum = component.weekday,
              let monthNum = component.month,
              let yearNum = component.year else {
            fatalError("Maybe Invalid Date")
        }
        let year: Year = yearNum
        let monthOfTheYear = MonthOfTheYear(rawValue: monthNum - 1)!
        let firstDate = try getFirstDateInMonth(monthOfTheYear: monthOfTheYear, year: year)
        let month = Month(firstDateOfMonth: firstDate, monthOfTheYear: monthOfTheYear, year: year)
        let day = Day(date: date, dayOfTheWeek: DayOfTheWeek(rawValue: weekDayNum - 1)!, month: month)
        
        return day
    }
}
