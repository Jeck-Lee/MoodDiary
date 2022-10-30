//
//  Util.swift
//  MoodDiary
//
//  Created by Jeck Lee on 2022/10/22.
//

import Foundation

enum Weekday: Int {
	case sun = 1
	case mon
	case tue
	case wed
	case thu
	case fri
	case sat
}

struct Util {
	/// 이 달의 첫번째 날짜
	private static func firstDayOfMonth(_ date: Date) -> Date? {
		var calendar: Calendar = Calendar(identifier: .gregorian)
		calendar.locale = Locale(identifier: "ko_KR")
		
		// 년,월만 입력했으므로 일은 자동으로 1일이 설정됨
		let components: DateComponents = calendar.dateComponents([.year, .month], from: date)

		return calendar.date(from: components)
	}
	/// 이 달의 마지막 날짜
	private static func lastDayOfMonth(_ date: Date) -> Date? {
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
	static func getFirtstWeekdayAndDaysCountOfMonth(date: Date) -> (weekday: Weekday?, daysCount: Int) {
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
		// 이번달의 마지막 날짜에서 이번달의 첫번째 날짜를 빼고 + 1
		// = 해당 월의 전체 일 수
		let days = lastDate.distance(from: firstDate, only: .day) + 1
		
		return (eWeekday, days)
	}
}
