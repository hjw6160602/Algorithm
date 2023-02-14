/*
 * @lc app=leetcode.cn id=26 lang=swift
 *
 * [26] 删除有序数组中的重复项
 */

// @lc code=start
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
         
         var slow = 0, fast = 0
         while fast < nums.count {
            if nums[slow] == nums[fast] {
                fast += 1
                continue
            }
            slow += 1
            nums[slow] = nums[fast]
         }
         // 数组长度为索引 + 1
         return slow + 1
    }
}
// @lc code=end

