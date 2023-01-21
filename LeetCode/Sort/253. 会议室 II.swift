//
//  253. 会议室 II.swift
//  Sort
//
//  Created by 贺嘉炜 on 2022/7/29.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/meeting-rooms-ii

import Foundation


extension Solution {
    
//    60 ms 71.43%
//    14.8 MB 28.57%
//    * Primary idea: Sort start and end separately, then count conflicts
//    * Time Complexity: O(nlogn), Space Complexity: O(n)
    
//    分别 排序处理开始时间和结束时间。这乍一听可能不太合理，毕竟开始和结束时间都是会议的一部分，
//    如果将两个属性分离并分别处理，会议自身的身份就消失了。但是，这样做其实是可取的，因为：
//    当遇到“会议结束”事件时，意味着一些较早开始的会议已经结束。
//    不用关心到底是哪个会议结束。所需要的只是 一些 会议结束, 从而提供一个空房间
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
//     1. 分别对开始时间和结束时间进行排序。
//        这将打乱开始时间和结束时间的原始对应关系。它们将被分别处理
        let startingTimes = intervals.map { $0[0] }.sorted()
        let endingTimes = intervals.map { $0[1] }.sorted()
        
        let intervalsCount = intervals.count
//     2. 考虑两个指针：start_ptr 和 end_ptr ，
//        分别代表 开始指针 和 结束指针 开始指针遍历每个会议 结束指针帮助我们跟踪会议是否结束。
        var i = 0, j = 0, meetingRoomsNum = 0
        
        while i < intervalsCount && j < intervalsCount {
//     3. 当考虑 start_ptr 指向的特定会议时，检查该开始时间是否大于 end_ptr 指向的会议
            if startingTimes[i] >= endingTimes[j] {
//          若是 说明 start_ptr 开始时，已经有会议结束。于是我们可以重用房间 自增 end_ptr 。
                j += 1
            } else {
//          否则，我们就需要开新房间
                meetingRoomsNum += 1
            }
//          重复这一过程，直到 start_ptr 处理完所有会议
            i += 1
        }
        return meetingRoomsNum
    }
    
    
//    60 ms 71.43%
//    16 MB 14.29%
    
//    开会也可以理解成坐公交，都是占用某个资源。
//    intervals = [[0,30],[5,10],[15,20]]
//    第一个人从0上车，从30下车；
//    第二个人从5上车，10下车。。。
//    我们的问题转化为最多车上有几个人（也就是最多有多少会议室）。
//    显然：上车，车上人数+1；下车，车上人数-1 我们把intervals拆解一下

//    上车：[0, 1], [5, 1], [15, 1]
//    下车：[10, -1], [20, -1], [30, -1]
//    然后按照第一个数把上下车排好序
//    人数  1    2     1    2     1      0
//         0----5----10----15----20-----30
//    变化 +1   +1    -1    +1    -1    -1
    func minMeetingRoomsP1(_ intervals: [[Int]]) -> Int {
        let aboard = intervals.map { [$0[0], 1] }
        let debus = intervals.map { [$0[1], -1] }
        let busTime = (aboard + debus).sorted {
            if $0[0] == $1[0] {
                // 这行能确保先下车 避免错误
                return $0[1] < $1[1]
            }
            return $0[0] < $1[0]
        }
        
        var maxNum = 0, cur = 0
//        print(busTime)
        for time in busTime {
            cur += time[1]
            maxNum = max(maxNum, cur)
        }
        return maxNum
    }
    
}

func test253MinMeetingRooms() {
//    let intervals = [[0,30],[5,10],[15,20]]
    
    let intervals = [[13,15],[1,13]]
    let x = LeetCode.minMeetingRoomsP1(intervals)
    print(x)
}


//给你一个会议时间安排的数组 intervals ，每个会议时间都会包括开始和结束的时间 intervals[i] = [starti, endi] ，返回 所需会议室的最小数量 。

//示例 1：
//输入：intervals = [[0,30],[5,10],[15,20]]
//输出：2

//示例 2：
//输入：intervals = [[7,10],[2,4]]
//输出：1

//提示：
//1 <= intervals.length <= 104
//0 <= starti < endi <= 106
