//
//  UtilTests.swift
//  MoodDiaryTests
//
//  Created by Jeck Lee on 2022/10/30.
//

import XCTest
@testable import MoodDiary

final class UtilTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	// This is an example of a functional test case.
	// Use XCTAssert and related functions to verify your tests produce the correct results.
	// Any test you write for XCTest can be annotated as throws and async.
	// Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
	// Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
	func testFirstWeekdayAndDays() throws {
		guard let testDate = Date.from(year: 2022, month: 10, day: 6) else {
			// 즉시 failure를 발생시키는 메서드
			// 뒤의 메시지는 Option으로 적으면 failed message에 붙어서 나온다
			// (https://velog.io/@p_ssungnni/iOS-Async-Unit-Test)
			XCTFail("testDate가 생성되지 않음")
			return
		}
		
		let testResult = Util.getFirtstWeekdayAndDaysCountOfMonth(date: testDate)
		
		guard let weekday = testResult.weekday else {
			XCTFail("test 결과, 월의 첫번째 weekday nil")
			return
		}
		XCTAssertEqual(weekday, .sat)
		XCTAssertEqual(testResult.daysCount, 31)
	}

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
