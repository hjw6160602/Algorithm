//
//  287. 寻找重复数.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/8/26.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/find-the-duplicate-number

import Foundation

extension Solution {
    
//    620 ms 59.42%
//    18.3 MB 10.14%
//    我们对 nums 数组建图，每个位置 i 连一条 i ~→ nums[i] 的边。
//    由于存在的重复的数字 target，因此 target 这个位置一定有起码两条指向它的边，因此整张图一定存在环，
//    且我们要找到的 target 就是这个环的入口，那么整个问题就等价于 142. 环形链表 II

//    我们先设置慢指针 low 和快指针 fast ，慢指针每次走一步，快指针每次走两步，
//    根据「Floyd 判圈算法」两个指针在有环的情况下一定会相遇，
//    此时我们再将slow 放置起点 0，两个指针每次同时移动一步，相遇的点就是答案
    
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0, fast = 0
//      每个位置连一条 i ~→ nums[i] 的边
        repeat {
            slow = nums[slow];
            fast = nums[nums[fast]];
        } while slow != fast
        //  此时我们再将slow 放置起点 0
        slow = 0
        while (slow != fast) {
            // 两个指针每次同时移动一步，相遇的点就是答案
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }
    
//    func findDuplicate(_ nums: [Int]) -> Int {
//        let sum = nums.reduce(0, +)
//        var expertation = 0
//        for i in 1...nums.count {
//            expertation += i
//        }
//
//
//        return expertation - sum
//    }
    
    // 双循环超出时间限制 O(n^2)
    func findDuplicateDeprecated2(_ nums: [Int]) -> Int {
        let n = nums.count
        for i in 0..<n-1 {
            let num = nums[i]
            for j in (i+1)..<n {
                if num == nums[j] {
                    return num
                }
            }
        }
        return 0
    }
    
    // 哈希表不满足空间复杂度
//    632 ms 36.23%
//    18.4 MB 8.69%
    func findDuplicateDeprecated(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return num
            } else {
                set.insert(num)
            }
        }
        return 0
    }
}

func test287findDuplicate() {
    let nums = [1,3,4,2,2]
    let x = LeetCode.findDuplicate(nums)
    print(x)
}

//给定一个包含 n + 1 个整数的数组 nums ，其数字都在 [1, n] 范围内（包括 1 和 n），可知至少存在一个重复的整数。
//假设 nums 只有 一个重复的整数 ，返回 这个重复的数 。
//你设计的解决方案必须 不修改 数组 nums 且只用常量级 O(1) 的额外空间。

//示例 1：
//输入：nums = [1,3,4,2,2] [1,3,4,2,5]
//             1 2 3 4 5
//输出：2

//示例 2：
//输入：nums = [3,1,3,4,2]
//输出：3

//提示：
//1 <= n <= 105
//nums.length == n + 1
//1 <= nums[i] <= n
//nums 中 只有一个整数 出现 两次或多次 ，其余整数均只出现 一次

//进阶：
//如何证明 nums 中至少存在一个重复的数字?
//你可以设计一个线性级时间复杂度 O(n) 的解决方案吗？
