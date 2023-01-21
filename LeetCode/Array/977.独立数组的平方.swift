//
//  977.独立数组的平方.swift
//  Array
//
//  Created by SaiDiCaprio on 2021/12/10.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/squares-of-a-sorted-array

import Foundation

extension Solution {
    
    //    执行用时： 216 ms 在所有 Swift 提交中击败了 88.03% 的用户
    //    内存消耗： 15.1 MB 在所有 Swift 提交中击败了 73.50% 的用户
    //    通过测试用例： 137 / 137
    func sortedSquares(_ nums: [Int]) -> [Int] {
        let count = nums.count
        var result = nums
        var i = 0
        var j = count - 1
        var cur = j
        while i <= j {
            if (nums[i] * nums[i] > nums[j] * nums[j]) {
                result[cur] = nums[i] * nums[i]
                i += 1
            } else {
                result[cur] = nums[j] * nums[j]
                j -= 1
            }
            cur -= 1
        }
        return result
    }
    
//    执行用时：216 ms 在所有 Swift 提交中击败了 88.03% 的用户
//    内存消耗：15.1 MB 在所有 Swift 提交中击败了 71.37% 的用户
//    通过测试用例：137 / 137
    func sortedSquaresPractice(_ nums: [Int]) -> [Int] {
        let count = nums.count
        var negative = -1
        var result = nums
        for i in 0..<count {
            if nums[i] < 0 {
                negative = i
            } else {
                break
            }
        }
        
        var index = 0
        var left = negative
        var right = negative + 1
        
        while left >= 0 || right < count {
            if left < 0 {
                result[index] = nums[right] * nums[right]
                right += 1
            } else if right == count {
                result[index] = nums[left] * nums[left]
                left -= 1
            } else if nums[left] * nums[left] < nums[right] * nums[right] {
                result[index] = nums[left] * nums[left]
                left -= 1
            } else {
                result[index] = nums[right] * nums[right]
                right += 1
            }
            index += 1
        }
        return result
    }
    
    // 执行用时：280 ms 在所有 Swift 提交中击败了 29.06% 的用户
    // 内存消耗：15.1 MB 在所有 Swift 提交中击败了 64.10% 的用户
    // 通过测试用例：137 / 137
    func sortedSquaresOld(_ nums: [Int]) -> [Int] {
        let count = nums.count
        var right = count
        var result = nums
        
        for i in 0..<count {
            if right == count &&  result[i] >= 0 {
                right = i
            }
            result[i] *= result[i]
        }
        
        if right == 0 {
            return result
        }
        if right == count {
            for i in 0..<count/2 {
                (result[i], result[count - i - 1]) = (result[count - i - 1], result[i])
            }
            return result
        }
        
        let nagtived = result[0..<right]
        var left = right - 1
        
        for cur in 0..<count {
            guard left >= 0 else {
                return result
            }
            guard right < count else {
                result[cur] = nagtived[left]
                left -= 1
                continue
            }
            
            if result[right] < nagtived[left] {
                result[cur] = result[right]
                right += 1
            } else {
                result[cur] = nagtived[left]
                left -= 1
            }
        }
        return result
    }
    

}

func testSortedSquares() {
    let nums = [-4,-1,0,3,10]
    let res = Solution.shared.sortedSquares(nums)
    print(res)
}



//
//给你一个按 非递减顺序 排序的整数数组 nums，返回 每个数字的平方 组成的新数组，要求也按 非递减顺序 排序。
//
//示例 1：
//
//输入：nums = [-4,-1,0,3,10]
//输出：[0,1,9,16,100]
//解释：平方后，数组变为 [16,1,0,9,100]
//排序后，数组变为 [0,1,9,16,100]
//示例 2：
//
//输入：nums = [-7,-3,2,3,11]
//输出：[4,9,9,49,121]

//提示：
//
//1 <= nums.length <= 104
//-104 <= nums[i] <= 104
//nums 已按 非递减顺序 排序

//进阶：
//
//请你设计时间复杂度为 O(n) 的算法解决本问题
