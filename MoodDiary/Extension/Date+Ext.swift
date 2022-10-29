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
}
