//
//  File.swift
//  Array
//
//  Created by 贺嘉炜 on 2023/3/30.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func testfindEqualSum() {
    let nums = [2, 2, 5, 4, 5, 4, 1, 6, 2, 1]
    let x = LeetCode.findEqualSum(nums)
    print(x)
}

// 输入一个数组 a[N]，要求选二个等分点，把数组分为三个连续的子数组，子数组中不包括等分点数据，且每个子数组累加和相等；
// 即等分点 i，j且 i<j，
// 能满足   a[0] +...+a[i-1]  =  a[i+1] + ... +a[j-1]  =  a[j+1] + ... + a[N-1]
// 返回等分点位置数组[i,  j]，如果找不到返回空数组[]

// 运行时间要求：< 10ms
// 数组长度：4 < N < 10000
// 数组元素取值范围：[1, 10000]
// 样例1：
// 输入：[2, 2, 5, 4, 5, 4, 1, 6, 2, 1]
// 输出：[3,6]
// 第一部分：【2 2 5】 = 9，中间：【5 4】，最后一部分：【6 2 1】


extension Solution {
    func findEqualSum(_ nums:[Int]) -> [Int] {
        guard nums.count > 4 else {
            return []
        }
        let n = nums.count
        // 用两个变量去直接标记左边和右边的和
        var leftSum = 0, rightSum = nums[n-1]
        var left = 0, right = n - 1
        var result = [Int]()
        var isAddLeft = true
        while left < n && right >= 0 {
            if isAddLeft {
                leftSum += nums[left]
            } else {
                rightSum += nums[right]
            }
            if leftSum == rightSum {
                let midSum = nums[left+2..<right-1].reduce(0, +)
                if midSum == leftSum {
                    result.append(left+1)
                    result.append(right-1)
                    return result
                } else {
                    return []
                }
            } else if leftSum < rightSum {
                isAddLeft = true
                left += 1
            } else {
                isAddLeft = false
                right -= 1
            }
        }
        return result
    }
    
    
    func findEqualSum2(_ nums:[Int]) -> [Int] {
        let n = nums.count
        var leftSum = Array(repeating: 0, count: n)
        var rightSum = Array(repeating:0, count: n)
        var left = 0
        var right = n - 1
        var result = [Int]()
        while left < n && right >= 0 {
            if left == 0 {
                leftSum[left] = nums[left]
            } else {
                leftSum[left] = leftSum[left-1] + nums[left]
            }
            if right == n - 1 {
                rightSum[right] = nums[right]
            } else {
                rightSum[right] = rightSum[right+1] + nums[right]
            }
            
            if leftSum[left] == rightSum[right] {
                result.append(left+1)
                result.append(right-1)
                return result
            } else if leftSum[left] < rightSum[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return result
    }
}
