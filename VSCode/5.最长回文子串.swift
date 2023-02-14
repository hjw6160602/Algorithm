/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 */

// @lc code=start
class Solution {
    // 拓展中心法 暴力遍历
    func longestPalindrome(_ s: String) -> String {
        let s = Array(s)
        var res = [Character]()

        for i in 0..<s.count {
            // 找到以 s[i] 为中心的回文串
            let s1 = palindrome(s, left: i, right: i)
            // 找到以 s[i] 和 s[i+1] 为中心的回文串
            let s2 = palindrome(s, left: i, right: i+1)
            // 更新答案
            res = res.count > s1.count ? res : s1
            res = res.count > s2.count ? res : s2
        }
        return String(res)
    }
    
    // 在 s 中寻找以 s[l] 和 s[r] 为中心的最长回文串
    private func palindrome(_ s: [Character], 
                            left: Int, 
                            right: Int) -> [Character] {
        var l = left, r = right
        while l >= 0 && r < s.count && 
              s[l] == s[r] {
            l -= 1
            r += 1
        }
        return Array(s[l+1..<r])
    }
    
    // 141/141 
    // 59.76 % (68 ms) 
    // 66.26 % (14.2 MB)
    func longestPalindromeDP(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        let chars = ArraySlice<Character>(s)
        // 初始化最大长度
        var maxLen = 1
        var subSequence = chars[0...0]
        
        var dp = Array(repeating: Array.init(repeating: false, count: s.count),
                       count: s.count)
          
        for i in (0..<s.count).reversed() {
            // 只填写右上角
            for j in i..<s.count {
                // 行和列 相等的直接返回 True
                if i == j {
                    dp[i][i] = true
                    continue
                }
                // 两头的字符必须相当 不相等下一个
                if chars[i] != chars[j] { continue }

                // 保证左下角的肯定是True 然后 如果字符串长度是2且相等
                guard dp[i+1][j-1] || j - i <= 2 else {
                    continue
                }
                // 那么当前dp数组可以更新为True
                dp[i][j] = true
                // 找到了最大长度 更新最大子串
                if j - i + 1 > maxLen {
                    maxLen = j - i + 1
                    subSequence = chars[i...j]
                }
            }
        }
        return String(subSequence)
    }
}
// @lc code=end

