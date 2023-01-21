//
//  922. 按奇偶排序数组 II.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/6/29.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
//    116 ms 80.95%
//    15.5 MB 38.10%
//    61 / 61
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: nums.count)
        var i = 0, j = 1
        // 偶数
        for num in nums {
            if num % 2 == 0 {
                res[i] = num
                i += 2
            }
        }
        // 奇数
        for num in nums {
            if num % 2 == 1 {
                res[j] = num
                j += 2
            }
        }
        return res
    }

//    时间：O(N)，其中 NN 是数组 nums 的长度。
//    空间：O(1)
//    116 ms 80.95%
//    15.5 MB 38.10%
    func sortArrayByParityIIP1(_ nums: [Int]) -> [Int] {
        var res = nums, j = 1
        
        for i in stride(from: 0, to: nums.count, by: 2) {
            // 奇偶匹配 直接continue
            guard res[i] & 1 == 1 else { continue }
            // 来到这里证明 奇偶不匹配
            while res[j] & 1 == 1 {
                // 如果j下标的数是奇数 那么 j 跳到下一个奇数 index
                j += 2
            }
            // 这里代表 i 下标是奇数 而 j 下标是偶数 那么互换数值
            (res[i], res[j]) = (res[j], res[i])
            
        }
        return res
    }
}

func test922SortArrayByParityII() {
    let nums = [4,2,5,7]
    let x = LeetCode.sortArrayByParityIIP1(nums)
    print(x)
}

//给定一个非负整数数组 nums，  nums 中一半整数是 奇数 ，一半整数是 偶数 。
//对数组进行排序，以便当 nums[i] 为奇数时，i 也是 奇数 ；当 nums[i] 为偶数时， i 也是 偶数 。
//你可以返回 任何满足上述条件的数组作为答案 。

//示例 1：
//输入：nums = [4,2,5,7]
//输出：[4,5,2,7]
//解释：[4,7,2,5]，[2,5,4,7]，[2,7,4,5] 也会被接受。

//示例 2：
//输入：nums = [2,3]
//输出：[2,3]

//提示：
//2 <= nums.length <= 2 * 10^4
//nums.length 是偶数
//nums 中一半是偶数
//0 <= nums[i] <= 1000

//进阶：可以不使用额外空间解决问题吗？
