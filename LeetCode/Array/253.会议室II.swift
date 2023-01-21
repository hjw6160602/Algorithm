//
//  253.会议室II.swift
//  Array
//
//  Created by SaiDiCaprio on 2021/2/24.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode.com/problems/meeting-rooms-ii/

import Foundation

extension Solution {
    // 分开排序
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        // 根据开始时间和结束时间分开排序
        let startingTimes = intervals.map { interval in interval[0] }.sorted()
        let endingTimes = intervals.map { interval in interval[1] }.sorted()
        
        let intervalsCount = intervals.count
        
        var i = 0, j = 0, meetingRoomsNum = 0
        while i < intervalsCount && j < intervalsCount {
            if startingTimes[i] < endingTimes[j] {
                // 开始时间如果小于结束时间
                // 那么就需要再开一间会议室
                meetingRoomsNum += 1
            } else {
                // 开始时间如果大于等于结束时间
                // 不需要再开一间会议室 直接将结束时间指针+1
                j += 1
            }
            i += 1
        }
        return meetingRoomsNum
    }
    
    // 最小堆
    func minMeetingRooms2(_ intervals: [[Int]]) -> Int {
        return 0
    }
}

func testMinMeetingRooms() {
    let count =  LeetCode.minMeetingRooms([[0,30], [5, 10], [15, 20]])
    print(count)
}
