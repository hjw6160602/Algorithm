/*
 * @lc app=leetcode.cn id=287 lang=swift
 *
 * [287] 寻找重复数
 */

// @lc code=start
class Solution {
    // 位置匹配 将对应的数字 放在对应下下标索引处
    func findDuplicate(_ nums: [Int]) -> Int {
        var nums = nums
        var i = 0
        while i < nums.count {
            var target = nums[i]
            while target != i  {
                if target == nums[target] {
                    return target
                }
                nums.swapAt(target, i)
                target = nums[i]
            }
            i += 1
        }
        return nums[0]
    }
}
// @lc code=end

