/*
 * @lc app=leetcode.cn id=516 lang=swift
 *
 * [516] 最长回文子序列
 */

// @lc code=start
class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let s = Array(s), n = s.count
        // dp 数组的含义是 在[i,j] 区间内 最长回文子序列的长度
        var dp = Array(repeating: Array(repeating: 0, count: n), 
                       count: n)
        // base case 
        for i in 0..<n {
            dp[i][i] = 1
        }
        // 反着遍历保证正确的状态转移
        for i in (0..<n-1).reversed() {
            for j in i+1..<n {
                // 状态转移方程
                if s[i] == s[j] {
                    dp[i][j] = dp[i+1][j-1] + 2
                } else {
                    dp[i][j] = max(dp[i][j-1], dp[i+1][j])
                }
            }
        }
        // 整个s的最长回文子串长度
        return dp[0][n-1]
    }
}
// @lc code=end

