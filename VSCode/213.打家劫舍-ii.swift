/*
 * @lc app=leetcode.cn id=213 lang=swift
 *
 * [213] 打家劫舍 II
 */

// @lc code=start
class Solution {
    // 4 ms 80%
    // 13.7 MB 96.67
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return nums[0] }
        
        // 最后一个房间不抢
        var dp = Array.init(repeating: 0, count: n)
        dp[1] = nums[0]
        // 由于最后一个房间不抢所以 这里直接遍历到dp[n-1]就好
        for i in 2..<n {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i-1])
        }

        // 第一个房间不抢
        var dp2 = Array.init(repeating: 0, count: n + 1)
        // 由于第一个房间不抢所以 dp[1] = 0 这里可以省略不写
        for i in 2...n {
            dp2[i] = max(dp2[i-1], dp2[i-2] + nums[i-1])
        }
        // 注意两个数组长度不一样 相差为1，都是拿着最后一位去比
        return max(dp[n-1], dp2[n])
    }
}
// @lc code=end

