//
//  Month.swift
//  SimpleCalendar
//
//  Created by Fumiya Tanaka on 2021/04/29.
//

import Foundation

public struct Month {
    var firstDateOfMonth: Date
    var monthOfTheYear: MonthOfTheYear
    var year: Year
}

public enum MonthOfTheYear: Int {
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case octorbar
    case november
    case december
    
    var number: Int {
        rawValue + 1
    }
}
