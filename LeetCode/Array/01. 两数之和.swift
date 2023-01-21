//
//  01. 两数之和.swift
//  Array
//
//  Created by 江雪 on 2021/2/19.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/two-sum

import Foundation

// 给定一个target
extension Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int:Int] = [:]
        
        for i in 0 ..< nums.count {
            if let j = dict[target - nums[i]] {
                return [j, i];
            } else {
                dict[nums[i]] = i;
            }
        }
        
        return [0, 0];
    }
    
    func twoSumSwift(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }
            dict[num] = i
        }
        
        fatalError("No valid outputs")
    }
    
    func twoSumPractice1(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (index, value) in nums.enumerated() {
            if let lastIndex = dict[target - value] {
                return [lastIndex, index]
            }
            dict[value] = index
        }
        return []
    }
    
    
//    执行用时： 72 ms 在所有 Swift 提交中击败了 21.37% 的用户
//    内存消耗： 13.6 MB 在所有 Swift 提交中击败了 95.57% 的用户
//    通过测试用例：57 / 57
    func twoSumPractice2(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count-1 {
            let left = target - nums[i]
            for j in i+1..<nums.count {
                if left == nums[j] {
                    return [i, j]
                }
            }
        }
        return []
    }
    
//    执行用时：48 ms 在所有 Swift 提交中击败了 83.67% 的用户
//    内存消耗：14 MB 在所有 Swift 提交中击败了 48.07% 的用户
//    通过测试用例：57 / 57
    func twoSumPractice3(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for i in 0..<nums.count {
            let current = nums[i]
            let left = target - current
            
            if let lastIndex = dict[current] {
                return [lastIndex, i]
            }
            dict[left] = i
        }
        
//        for (i, num) in nums.enumerated() {
//            if let lastIndex = dict[target - num] {
//                return [lastIndex, i]
//            }
//            dict[num] = i
//        }
        return []
    }
    
//    36 ms 98.74%
//    14.2 MB 14.06%
    func twoSumP4(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            let left = target - nums[i]
            if let j = dict[nums[i]] {
                return [j, i]
            }
            dict[left] = i
        }
        return [0, 0];
    }
}

func testTwoSum() {
    let res = LeetCode.twoSumP4([3,2,4], 6)
//    let res = Solution.shared.twoSumP4([2,7,11,15], 9)
    print(res)
}


//给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 的那 两个 整数，并返回它们的数组下标。
//你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
//你可以按任意顺序返回答案。

//示例 1：
             //0 1 2  3
//输入：nums = [2,7,11,15], target = 9
//输出：[0,1]
//解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1]

//示例 2：
//输入：nums = [3,2,4], target = 6
//输出：[1,2]

//示例 3：
//输入：nums = [3,3], target = 6
//输出：[0,1]

//提示：
//2 <= nums.length <= 103
//-109 <= nums[i] <= 109
//-109 <= target <= 109
//只会存在一个有效答案



