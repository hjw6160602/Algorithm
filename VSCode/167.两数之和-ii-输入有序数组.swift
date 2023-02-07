/*
 * @lc app=leetcode.cn id=167 lang=swift
 *
 * [167] 两数之和 II - 输入有序数组
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0, right = nums.count - 1
        // while nums[right] > target {
        //     right -= 1
        // }
        while nums[left] + nums[right] != target {
            if nums[left] + nums[right] < target {
                left += 1
            } else {
                right -= 1
            } 
        }
        return [left + 1, right + 1]
    }
}
// @lc code=end

