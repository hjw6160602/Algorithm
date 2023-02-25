/*
 * @lc app=leetcode.cn id=583 lang=swift
 *
 * [583] 两个字符串的删除操作
 */

// @lc code=start
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var s1 = Array(word1), s2 = Array(word2)
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
        
        return m - dp[m][n] + n - dp[m][n]
    }
}
// @lc code=end

