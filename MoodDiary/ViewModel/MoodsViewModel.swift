//
//  MoodsViewModel.swift
//  MoodDiary
//
//  Created by Jeck Lee on 2022/10/10.
//

import Foundation

class MoodsViewModel {
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
