/*
 * @lc app=leetcode.cn id=53 lang=swift
 *
 * [53] 最大子数组和
 */

// @lc code=start
class Solution {

    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        // dp数组定义着：以i结尾的最大子数组和
        var dp = Array(repeating:0, count: nums.count)

        dp[0] = nums[0]
        
        var res = dp[0]
        for i in 1..<nums.count {
            // 动态转移方程 注意这里的i-1不能越界
            dp[i] = max(dp[i-1] + nums[i], nums[i])
            // dp状态根据加与不加来转移，不加就是当前i位置的值
            res = max(res, dp[i])
        }

        return res
    }

    // 前缀和思路
    func maxSubArrayPreSum(_ nums: [Int]) -> Int {
        var preSum = Array(repeating: 0, count: nums.count + 1)
         // 构造 nums 的前缀和数组
        for i in 1...nums.count {
            preSum[i] = preSum[i-1] + nums[i-1]
        }
         
        var minPreSum = Int.max
        var res = Int.min
        for i in 0..<nums.count {
            // 维护 minPreSum 是 preSum[0..i] 的最小值
            minPreSum = min(minPreSum, preSum[i])
            // 以 nums[i] 结尾的最大子数组和就是 preSum[i+1] - min(preSum[0..i])
            res = max(res, preSum[i+1] - minPreSum)
        }
        return res
    }



}
// @lc code=end

