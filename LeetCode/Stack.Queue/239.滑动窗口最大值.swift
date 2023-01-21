//
//  239.滑动窗口最大值.swift
//  Stack.Queue
//
//  Created by SaiDiCaprio on 2021/2/4.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
// https://leetcode-cn.com/problems/sliding-window-maximum/

import Foundation

extension Solution {
    
    // 较笨的解法 超出时间限制 时间复杂度：O(n * k)
    func maxSlidingWindowBL(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 1 {
            return nums
        }
        let maxCount = nums.count - k + 1 // 8 - 3 + 1 = 6
        var maxNums: [Int] = []
        for index in 0..<maxCount {
            let r = index + k
            let slide = nums[index..<r]
            let max = slide.max()
            maxNums.append(max!)
        }
        return maxNums
    }
    
    // 优化了一部分 60/61 但是依然超出时间限制
    func maxSlidingWindowBL2(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 0 && k > 0 else { return [] }
        guard k > 1 else { return nums}
        // 能来到这里证明至少有2个元素
        // 优化暴力算法中的比较次数
        var maxIndex = 0
        var res = [Int]()
        
        // 一上来先找出来一波结果 然后再去循环
        for i in 1..<k {
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }
        
        for (i, num) in nums.enumerated() {
            let prev = i - k + 1
            
            if maxIndex < prev {
                maxIndex = prev
                for j in prev...i {
                    if nums[j] > nums[maxIndex] {
                        maxIndex = j
                    }
                }
            } else if num > nums[maxIndex] {
                maxIndex = i
            }
            if prev >= 0 {
                res.append(nums[maxIndex])
            }
        }
        return res
    }
    
    // 双端队列解法 时间复杂度：O(n)
    // 超出时间限制 60/61 双端队列存了元组和Swift语法函数调用导致
    // 1. 队列中存放的是索引
    // 2. 队列中的元素元素值是逐渐减小的
    // 3. 队列头部的索引如果是非法的 那么弹出队列头部的元素
    func maxSlidingWindowP1(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 0 && k > 0 else { return [] }
        guard k > 1 else { return nums}
        
        // 能来到这里证明至少有2个元素
        var queueDoubleEnd: [(index: Int, value: Int)]  = [(Int, Int)]()
        var res = [Int]()
        var prev = 0
        // 2. 队列中的元素元素值是逐渐减小的
        for (i, num) in nums.enumerated() {
            // 不断的去删除队列尾部的小于当前 num 的 元素
            while !queueDoubleEnd.isEmpty && queueDoubleEnd.last!.value <= num {
                _ = queueDoubleEnd.popLast()
            }
        
            // 遇到了第一个比当前元素大的 那么入队
            queueDoubleEnd.append((i, num))
            
            // 计算出有效的滑动窗口最前面的值
            prev = i - k + 1
            guard prev >= 0 else { continue }
            
            // 如果位列头部的索引过期了 那么删除掉队头元素
            if queueDoubleEnd[0].index < prev {
                queueDoubleEnd.removeFirst()
            }
            
            // 取出头部的元素就是滑动窗口的最大值
            res.append(queueDoubleEnd[0].value)
        }
        return res
    }
    
    // 双端队列解法 时间复杂度：O(n)
    // 执行用时：3380 ms 在所有 Swift 提交中击败了 51.14% 的用户
    // 内存消耗：24.9 MB 在所有 Swift 提交中击败了 60.23% 的用户
    // 通过测试用例：61 / 61
    func maxSlidingWindowP2(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 0 && k > 0 else { return [] }
        guard k > 1 else { return nums}
        
        // 能来到这里证明至少有2个元素
        // 双端队列 存储 原数组中的索引 索引对应的值单调递减
        var queueDoubleEnd = [Int]()
        var res = [Int]()
        var prev = 0
        // 2. 队列中的元素元素值是逐渐减小的
        for i in 0..<nums.count {
            // 不断的去删除队列尾部的小于当前 num 的 元素
            while !queueDoubleEnd.isEmpty && nums[queueDoubleEnd.last!] <= nums[i] {
                _ = queueDoubleEnd.popLast()
            }
        
            // 遇到了第一个比当前元素大的 那么入队
            queueDoubleEnd.append(i)
            
            // 计算出有效的滑动窗口最前面的值
            prev = i - k + 1
            guard prev >= 0 else { continue }
            
            // 如果位列头部的索引过期了 那么删除掉队头元素
            if queueDoubleEnd[0] < prev {
                queueDoubleEnd.removeFirst()
            }
            
            // 取出头部的元素就是滑动窗口的最大值
            res.append(nums[queueDoubleEnd[0]])
        }
        return res
    }
    
}

func testMaxSlidingWindow() {
    let res = Solution.shared.maxSlidingWindowBL2([1,3,-1,-3,5,3,6,7], 3)
//    let res = Solution.shared.maxSlidingWindowBL2([4,-2], 2)
    print(res)
    
}

//[1  3  -1] -3  5  3  6  7          -1 1 3
//1  [3  -1 -3]  5  3  6  7       -3 -1 1 3
//1   3  [-1 -3  5] 3  6  7       -3 -1 1 3 5 6 7

// 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。
//
// 返回滑动窗口中的最大值。
//
// 示例 1：
//
// 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
// 输出：[3,3,5,5,6,7]
// 解释：
// 滑动窗口的位置                   最大值
// ---------------               -----
// [1  3  -1] -3  5  3  6  7       3
//  1 [3  -1  -3] 5  3  6  7       3
//  1  3 [-1  -3  5] 3  6  7       5
//  1  3  -1 [-3  5  3] 6  7       5
//  1  3  -1  -3 [5  3  6] 7       6
//  1  3  -1  -3  5 [3  6  7]      7
// 示例 2：
//
// 输入：nums = [1], k = 1
// 输出：[1]
// 示例 3：
//
// 输入：nums = [1,-1], k = 1
// 输出：[1,-1]
// 示例 4：
//
// 输入：nums = [9,11], k = 2
// 输出：[11]
// 示例 5：
//
// 输入：nums = [4,-2], k = 2
// 输出：[4]
