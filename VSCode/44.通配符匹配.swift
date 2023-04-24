/*
 * @lc app=leetcode.cn id=44 lang=swift
 *
 * [44] 通配符匹配
 */

// @lc code=start
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s), p = Array(p), m = s.count, n = p.count
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        
        for j in 0...n {
            dp[0][j] = j == 0 || (dp[0][j - 1] && p[j - 1] == "*")
        }
        
        if m < 1 || n < 1 {
            return dp[m][n]
        }
        
        for i in 1...m {
            for j in 1...n {
                if p[j - 1] != "*" {
                    if p[j - 1] == s[i - 1] || p[j - 1] == "?" {
                        dp[i][j] = dp[i - 1][j - 1]
                    } else {
                        dp[i][j] = false
                    }
                } else {
                    dp[i][j] = dp[i][j - 1] || dp[i - 1][j]
                }
            }
        }
        
        return dp[m][n]
    }

    func isMatch(_ s: String, _ p: String) -> Bool {
        var s = Array(s)
        var pattern = Array(p)
        var i = 0, j = 0
        while i < s.count {
            guard j < pattern.count else {
                return false
            }
            if s[i] == pattern[j] || pattern[j] == "?" {
                i += 1
                j += 1
            } else if pattern[j] == "*" {
                i += 1
            } else {
                return false
            }
        }
        if j == pattern.count - 1 && pattern[j] == "*" {
            return true
        }
        if j < pattern.count {
            return false
        }
        return true
    }
}
// @lc code=end

