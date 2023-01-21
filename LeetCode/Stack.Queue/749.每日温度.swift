//
//  749.每日温度.swift
//  Stack.Queue
//
//  Created by 贺嘉炜 on 2021/2/25.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/daily-temperatures

import Foundation

extension Solution {
    //  MARK: - 单调栈解法
    //  执行用时：972 ms 击败了66.04%
    //  内存消耗：22.6 MB 击败了80.19%
    //  通过测试用例：47 / 47
    func dailyTemperaturesStack1(_ T: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: T.count)
        var stack = [Int]()
        // 遍历数组中的素有温度元素
        for (index, temperature) in T.enumerated() {
            var need = true
            while need {
                if let lastIndex = stack.last {
                    let lastT = T[lastIndex]
                    if lastT >= temperature {
                        // 如果能够保证单调性，那么直接append进栈
                        stack.append(index)
                        need = false
                    } else {
                        res[lastIndex] = index - lastIndex
                        _ = stack.popLast()
                    }
                } else {
                    // 如果栈中没有元素 那么直接append进去
                    stack.append(index)
                    need = false
                }
            }
        }
        return res
    }
    
    /// 早期仿Java写法 wile循环写的略丑陋
    func dailyTemperaturesJava1(_ T: [Int]) -> [Int] {
        guard T.count > 0 else {
            return []
        }
        var res = Array(repeating: 0, count: T.count)
        // 这里采用一个栈来找到 左边和右边第一个比ta大的数
        var stack = [Int]()
        
        for idx in 0..<T.count {
            // 这里应该是大于 不能是大于等于
            while !stack.isEmpty && T[idx] > T[stack.last!] {
                let topIdx = stack.last!
                res[topIdx] = idx - topIdx
                _ = stack.popLast()
            }
            stack.append(idx)
        }
        return res
    }
    
    /// 简化写法
    func dailyTemperaturesStack2(_ T: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: T.count)
        var stack = [Int]()
        // 遍历数组中的素有温度元素
        for (index, temperature) in T.enumerated() {
            while let lastIndex = stack.last,
                  T[lastIndex] < temperature {
                res[lastIndex] = index - lastIndex
                _ = stack.popLast()
            }
            // 如果栈中没有元素 那么直接append进去
            stack.append(index)
        }
        return res
    }
    
    //  MARK: - 双指针倒推
    func dailyTemperature2(_ T: [Int]) -> [Int] {
        guard T.count > 0 else {
            return []
        }
        /**
         * 如果 T[i] < T[j] 那么res[i] = j - i, i--
         * 如果 T[i] == T[j]
         */
        var res = Array(repeating: 0, count: T.count)
        for i in (0...T.count-2).reversed() {
            var j = i + 1
            while true {
                if T[i] < T[j] {
                    res[i] = j - i
                    break
                } else if res[j] == 0 {
                    res[i] = 0
                    break
                } else if T[i] == T[j] {
                    res[i] = res[j] + j - i
                    break
                }
                j = j + res[j]
            }
        }
        return res
    }
    
    

    // 执行用时： 1116 ms 击败了 29.25%
    // 内存消耗： 22.7 MB 击败了 42.45%
    func dailyTemperaturesP1(_ T: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: T.count)
        guard T.count > 1 else { return res }
        for i in (0..<T.count-1).reversed() {
            var j = i + 1
            while j < T.count {
                if T[i] < T[j] {
                    res[i] = j - i
                    break
                } else if res[j] == 0 {
                    res[i] = 0
                    break
                }  else {
                    j = j + res[j]
                }
            }
        }
        return res
    }
}

func testDailyTemperatures() {
    let res = LeetCode.dailyTemperaturesP1([73, 74, 75, 71, 69, 72, 76, 78])
    print(res)
}

//  单调递增栈 确定左边或者右边第一个比ta小的数
//     0   1   2   3   4   5   6   7
//    [73, 74, 75, 71, 69, 72, 76, 73]
//L:       73  74          69  72  72
//R:   71  71  71  69          73
//    单调递增 栈
//    [69 72 73]

////   单调递减栈 确定左边或者右边第一个比ta大的数
//      0   1   2   3   4   5   6   7
//     [73, 74, 75, 71, 69, 72, 76, 73]
//L:                75  71  75      76
//R:    74  75  76  72  72  76
//     单调递减 栈
//     [76 73]

//  请根据每日 气温 列表，重新生成一个列表。
//  对应位置的输出为：要想观测到更高的气温，至少需要等待的天数。
//  如果气温在这之后都不会升高，请在该位置用 0 来代替。
//
//  例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，
//  你的输出应该是                   [1,   1,  4,  2,  1,  1,  0,  0]。
//
//  提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。
//
//  通过次数135,058提交次数204,436
