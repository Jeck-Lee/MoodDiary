//
//  MoodsViewModel.swift
//  MoodDiary
//
//  Created by Jeck Lee on 2022/10/10.
//

import Foundation

class MoodsViewModel {
	/// 이 달의 첫번째 날짜
	private func firstDayOfMonth(_ date: Date) -> Date? {
		var calendar: Calendar = Calendar(identifier: .gregorian)
		calendar.locale = Locale(identifier: "ko_KR")
		
		// 년,월만 입력했으므로 일은 자동으로 1일이 설정됨
		let components: DateComponents = calendar.dateComponents([.year, .month], from: date)

		return calendar.date(from: components)
	}
	/// 이 달의 마지막 날짜
	private func lastDayOfMonth(_ date: Date) -> Date? {
		var calendar: Calendar = Calendar(identifier: .gregorian)
		calendar.locale = Locale(identifier: "ko_KR")

		guard let firstDate = firstDayOfMonth(date) else {
			return nil
		}

		// 다음달 첫번째 날짜에서 -1 일
		let nextMonth = calendar.date(byAdding: .month, value: 1, to: firstDate)
		let lastDate = calendar.date(byAdding: .day, value: -1, to: nextMonth!)

		return lastDate
	}
	
	/**
	 특정 날짜를 입력하면, 그 달의 첫 번째 요일과 그 달의 전체 일수를 반환
	 - Returns: weekday: 1: 일요일 / 2: 월요일 / 3: 화요일 / 4: 수요일 / 5: 목요일 / 6: 금요일 / 7: 토요일
	 */
	func getFirtstWeekdayAndDaysCountOfMonth(date: Date) -> (weekday: Weekday?, daysCount: Int) {
		var calendar: Calendar = Calendar(identifier: .gregorian)
		calendar.locale = Locale(identifier: "ko_KR")
		
		guard let firstDate = firstDayOfMonth(date),
			  let weekday = firstDate.weekday,
			  let eWeekday = Weekday(rawValue: weekday) else {
			return (nil, 0)
		}
		
		guard let lastDate = lastDayOfMonth(date) else {
			return (eWeekday, 0)
		}
		let days = lastDate.distance(from: firstDate, only: .day)
		
		return (eWeekday, days)
	}
	/**
	 View에 그릴 첫 번째 요일의 실제 인덱스 반환
	 - Parameters:
	   - isStartSun: 사용자 옵션이 일요일 시작인지 월요일 시작인지 여부
	   - fisrtWeekday: 해당 월의 첫 번째 시작 요일
	 - Returns: index
	 */
	func getFirstIndexForDrawing(isStartSun: Bool, fisrtWeekday: Weekday) -> Int {
		return 1
	}
	/**
	 View에 그릴 때 앞에 비워야 하는 항목 갯수가 몇 개인지 반환
	 - Parameters:
	   - isStartSun: 사용자 옵션이 일요일 시작인지 월요일 시작인지 여부
	   - fisrtWeekday: 해당 월의 첫 번째 시작 요일
	 - Returns: count
	 */
	func getEmptyCountForDrawing(isStartSun: Bool, fisrtWeekday: Weekday) -> Int {
		return 1
	}
	/**
	 View에 그릴 특정 날짜의 실제 인덱스 반환
	 - Parameters:
	   - isStartSun: 사용자 옵션이 일요일 시작인지 월요일 시작인지 여부
	   - date: 인덱스를 구하고자 하는 특정 날짜
	 - Returns: index
	 */
	func getIndexForDrawing(isStartSun: Bool, date: Date) -> Int {
		return 1
	}
}
