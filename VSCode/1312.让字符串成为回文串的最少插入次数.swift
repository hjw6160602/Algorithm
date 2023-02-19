/*
 * @lc app=leetcode.cn id=1312 lang=swift
 *
 * [1312] 让字符串成为回文串的最少插入次数
 */

// @lc code=start
class Solution {
    func minInsertions(_ s: String) -> Int {
        var s = Array(s), n = s.count
        var dp = Array(repeating: Array(repeating: 0, count: n), 
                       count: n)

        // 反着遍历保证状态转移
        for i in (0..<n-1).reversed() {
            for j in i+1..<n {
                // 状态转移方程
                if s[i] == s[j] {
                    // 如果当前字符相等那么不需要做插入操作
                    dp[i][j] = dp[i+1][j-1]
                } else {
                    // 如果状态不相等，那么需要先把s[i+1..j] 和s[i..j-1]变成回文串
                    // 然后选择插入次数较少的，然后插入的字符s[i]或者s[j]插入进去
                    // 使得s[i..j]整体是回文串
                    dp[i][j] = min(dp[i][j-1], dp[i+1][j]) + 1
                }
            }
        }

        return dp[0][n-1]
    }
}
// @lc code=end

