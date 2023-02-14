/*
 * @lc app=leetcode.cn id=53 lang=swift
 *
 * [53] 最大子数组和
 */

// @lc code=start
class Solution {

    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }

        var dp = Array(repeating:0, count: nums.count)

        dp[0] = nums[0]
        
        var res = dp[0]
        for i in 1..<nums.count {
            dp[i] = max(dp[i-1] + nums[i], nums[i])
            res = max(res, dp[i])
        }

        return res
    }

}
// @lc code=end

