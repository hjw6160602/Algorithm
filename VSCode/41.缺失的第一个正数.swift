/*
 * @lc app=leetcode.cn id=41 lang=swift
 *
 * [41] 缺失的第一个正数
 */

// @lc code=start
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var isFillArray = Array(repeating: false, count: nums.count)
        var minPosNo = 1
        for num in nums {
            if num > 0 {
                minPosNo = min(minPosNo, num)
            }
        }

        for num in nums {
            if num > 0 && num < isFillArray.count {
                isFillArray[num] = true
            }
        }

        for i in 1..<isFillArray.count {
            if isFillArray[i] == false {
                return i
            }
        }
        return minPosNo

    }
}
// @lc code=end

