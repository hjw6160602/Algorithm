/*
 * @lc app=leetcode.cn id=665 lang=swift
 *
 * [665] 非递减数列
 */

// @lc code=start
class Solution {
    // 136 ms 80%
    // 14.1 MB 40%
    func checkPossibility(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        var nums = [Int.min] + nums + [Int.max]
        var cnt = 0
        var index = 2
        for i in 2...nums.count {
            if nums[i-1] > nums[i] {
                cnt += 1
                index = i
            }
        }
        if cnt > 1 { return false }
        if nums[index-1] < nums[index+1] || nums[index-2] < nums[index] {
            return true
        } else {
            return false
        }
    }

    func checkPossibilityW1(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return true
        }
        var res = 0
        for i in 1..<nums.count {
            if nums[i-1] > nums[i] {
                res += 1
            }
        }
        return res < 2
    }
}
// @lc code=end

