//
//  Date+Ext.swift
//  MoodDiary
//
//  Created by Jeck Lee on 2022/10/29.
//

import Foundation

extension Date {
	func toString(format: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		return dateFormatter.string(from: self)
	}
	
	var weekday: Int? {
		return Calendar.current.dateComponents([.weekday], from: self).weekday
	}
	
	func distance(from date: Date, only component: Calendar.Component, calendar: Calendar = .current) -> Int {
		let days1 = calendar.component(component, from: self)
		let days2 = calendar.component(component, from: date)
		return days1 - days2
	}
	
	// MARK: 날짜 생성
	/// Create a date from specified parameters
	///
	/// - Parameters:
	///   - year: The desired year
	///   - month: The desired month
	///   - day: The desired day
	/// - Returns: A `Date` object
	static func from(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil) -> Date? {
		let calendar = Calendar(identifier: .gregorian)
		var dateComponents = DateComponents()
		if let year = year {
			dateComponents.year	= year
		}
		if let month = month {
			dateComponents.month = month
		}
		if let day = day {
			dateComponents.day	= day
		}
		if let hour = hour {
			dateComponents.hour	= hour
		}
		if let minute = minute {
			dateComponents.minute = minute
		}
		return calendar.date(from: dateComponents) ?? nil
	}
}
