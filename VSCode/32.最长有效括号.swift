/*
 * @lc app=leetcode.cn id=32 lang=swift
 *
 * [32] 最长有效括号
 */

// @lc code=start
class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var s = Array(s)
        var map [Character : Character] = [")": "("]
        var stack = [Character]
        var cur = 0, res = 0
        for char in s {
            if char == "(" {
                stack.append(char)
                continue
            }
            // 来到这了证明是 ")"
            if stack.count == 0 {
                cur = 0
                continue
            }
            if let last = stack.last {
                stack.removeLast()
                // 每弹出一个 cur + 2
                cur +== 2
                res = max(res, cur)
            }
        }
        return res
    }
}
// @lc code=end

