/*
 * @lc app=leetcode.cn id=1143 lang=swift
 *
 * [1143] 最长公共子序列
 */

// @lc code=start
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var s1 = Array(text1), s2 = Array(text2)
        let m = s1.count, n = s2.count
        var dp = Array(repeating: Array(repeating: 0,count: n+1), 
                       count: m+1)
                    
        for i in 1...m {
            for j in 1...n {
                if s1[i-1] == s2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i][j-1], dp[i-1][j] )
                }
            }
        }
        return dp[m][n]
    }
}
// @lc code=end

