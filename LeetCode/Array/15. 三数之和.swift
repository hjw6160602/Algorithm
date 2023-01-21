//
//  15. 三数之和.swift
//  Array
//
//  Created by SaiDiCaprio on 2021/2/24.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/3sum

import Foundation

extension Solution {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        guard nums.count > 2 else { return [] }
        
        var res: [[Int]] = []
        //0. 先排序
        let sortedNums = nums.sorted()
//        print(sortedNums)
//        let lastIdx = nums.count - 2
        let lastRight = nums.count - 1
        for index in 0..<nums.count - 2 {
            // 取出index的重复操作 如果 当前index指针的值 和上一个元素的值相等
            if index > 0 && sortedNums[index] == sortedNums[index - 1] {
                // 直接跳过
                continue
            }
            var l = index + 1
            var r = lastRight
            // 在定位好第一个数之后剩下的数
            let remain = -sortedNums[index]
            while l < r {
                let sumLr = sortedNums[l] + nums[r]
                if sumLr == remain {
                    res.append([index, l, r])
                    l += 1
                    r -= 1
                    // 去除重复操作
                    while l < r && sortedNums[l] == sortedNums[l + 1] {
                        l += 1
                    }
                    while l < r && sortedNums[r] == sortedNums[r - 1] {
                        r -= 1
                    }
                } else if (sumLr < remain) {
                    l += 1
                } else {
                    r -= 1
                }
            }
        }
        return res
    }
    
//    116 ms 41.07%
//    17.5 MB 89.53%
    
    func threeSumP1(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        
        var res: [[Int]] = []
        //0. 先排序
        let sortedNums = nums.sorted()
        
        for i in 0..<nums.count - 2 {
            // 排除连续相等的重复的情况
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            var l = i + 1, r = nums.count - 1
            let remain = -sortedNums[i]
            while r > l {
                if sortedNums[l] + sortedNums[r] < remain {
                    l += 1
                } else if sortedNums[l] + sortedNums[r] > remain {
                    r -= 1
                } else {
                    res.append([sortedNums[i], sortedNums[l], sortedNums[r]])
                    l += 1
                    r -= 1
                    // 去除重复操作
                    while l < r && sortedNums[l] == sortedNums[l - 1] {
                        l += 1
                    }
                    while l < r && sortedNums[r] == sortedNums[r + 1] {
                        r -= 1
                    }
                }
            }
        }
        return res
    }
    
//    108 ms 59.75%
//    17.6 MB  61.60%
    func threeSumP2(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        
        var res: [[Int]] = []
        //0. 先排序
        let nums = nums.sorted()
        // 利用双指针向中间去靠拢
        var last = Int.max
        for a in 0..<nums.count - 2 {
            var b = a + 1, c = nums.count - 1
            if nums[a] == last {
                continue
            }
            while b < c {
                if nums[a] + nums[b] + nums[c] ==  0 {
                    res.append([nums[a], nums[b], nums[c]])
                    // 如果找到了一个组合 那么 两个指针都向中间靠拢
                    c -= 1
                    b += 1
                    // 去除重复操作
                    while b < c && nums[b] == nums[b - 1] {
                        b += 1
                    }
                    while b < c && nums[c] == nums[c + 1] {
                        c -= 1
                    }
                } else if nums[a] + nums[b] + nums[c] > 0 {
                    c -= 1
                } else {
                    b += 1
                }
            }
            // 这里记录上一个遍历过的值
            last = nums[a]
        }
        return res
    }
    
//    108 ms 59.75%
//    17.3 MB 98.97%
    func threeSumSoap(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        
        guard nums.count >= 3 else {
            return res
        }
        
        let nums = nums.sorted()
        
        for i in 0..<nums.count - 2 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            
            let firstNum = nums[i], remainingSum = -firstNum
            var m = i + 1, n = nums.count - 1
            
            while m < n {
                if nums[m] + nums[n] == remainingSum {
                    res.append([firstNum, nums[m], nums[n]])
                    
                    repeat {
                        m += 1
                    } while nums[m] == nums[m - 1] && m < n
                    
                    repeat {
                        n -= 1
                    } while nums[n] == nums[n + 1] && m < n
                } else if nums[m] + nums[n] < remainingSum {
                    m += 1
                } else {
                    n -= 1
                }
            }
        }
        
        return res
    }
}

func test15ThreeSum() {
    testCase1()
//    testCase174()
}

func testCase0() {
    let nums: [Int] = [0]
    let res = LeetCode.threeSumP1(nums)
    print(res)
}

func testCase1() {
    let nums = [-4,-1,-1,0,1,2]
    //    nums = [-2,0,0,2,2]
    let res = LeetCode.threeSumP1(nums)
    print(res)
    print([[-1,-1,2],[-1,0,1]])
}

func testCase174() {
    let nums = [-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0]
//    [-5, -5, -4, -4, -4, -2, -2, -2, 0, 0, 0, 1, 1, 3, 4, 4]
    let res = LeetCode.threeSumP1(nums)
    print(res)
    print([[-5,1,4],[-4,0,4],[-4,1,3],[-2,-2,4],[-2,1,1],[0,0,0]])
    
}

// 给你一个包含 n 个整数的数组 nums
// 判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组
//
// 注意：答案中不可以包含重复的三元组

//示例 1：
//输入：nums = [-1,0,1,2,-1,-4] [-4,-1,-1,0,1,2]
//输出：[[-1,-1,2],[-1,0,1]]
//示例 2：

//输入：nums = []
//输出：[]

//示例 3：
//输入：nums = [0]
//输出：[]
