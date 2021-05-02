//
//  CalendarModelTests.swift
//  SimpleCalendarTests
//
//  Created by Fumiya Tanaka on 2021/05/02.
//

@testable import SimpleCalendar
import XCTest

class CalendarModelTests: XCTestCase {

    let calendar: Calendar = .autoupdatingCurrent
    lazy var model = CalendarModel(calendar: calendar)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetDaysOfMonth() throws {
        let firstDateOfMonth = try model.getFirstDateOfMonth(monthOfTheYear: .may, year: 2021)
        let month = Month(firstDateOfMonth: firstDateOfMonth, monthOfTheYear: .may, year: 2021)
        let days = try model.getDaysOfMonth(month: month)
        
        let numberOfDays: Int = model.getNumberOfDaysInMonth(month: month)
        
        for (index, day) in days.enumerated() {
            let components = calendar.dateComponents([.day], from: day.date)
            XCTAssertNotNil(components.day)
            XCTAssertEqual(components.day!, index % numberOfDays + 1)
        }        
    }
}
