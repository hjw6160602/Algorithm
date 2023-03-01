/*
 * @lc app=leetcode.cn id=198 lang=swift
 *
 * [198] 打家劫舍
 */

// @lc code=start
class Solution {
// 4 ms  67.47%
// 13.7 MB 85.54%
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums[0]
        }
        let n = nums.count
        var dp = Array.init(repeating: 0, count: n + 1)
        dp[1] = nums[0]
        for i in 2...nums.count {
            dp[i] = max(dp[i-1], nums[i-1] + dp[i-2])
        }
        return dp[n]
    }
}
// @lc code=end

