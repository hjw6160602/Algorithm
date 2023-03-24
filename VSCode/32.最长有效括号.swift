/*
 * @lc app=leetcode.cn id=32 lang=swift
 *
 * [32] 最长有效括号
 */

// @lc code=start
class Solution {
// 4 ms 94%
// 14.4 MB 32%
    func longestValidParentheses(_ s: String) -> Int {
        var s = Array(s), stack = [Int]()
        // dp[i] 的定义：记录以 s[i-1] 结尾的最长合法括号子串长度
        var dp = Array(repeating:0, count: s.count+1)
        for i in 0..<s.count {
            if s[i] == "(" {
                // 遇到左括号,记录索引,入栈
                stack.append(i)
                // 左括号不可能是合法括号子串的结尾,则以s[i]结尾的最长合法子串长度是0
                continue
            }
            // 来到这了证明是 ")"
            if stack.count == 0 {
                // 没有配对的左括号,则以s[i]结尾的最长合法子串长度是0
                continue
            }
            // 来到这里证明栈里面有 元素
            // 配对的左括号对应索引
            let leftIndex = stack.removeLast()
            // 以这个')'结尾的最长子串长度
            // = 以这个')'结尾的最短合法子串长度
            //   + 之前相邻的s[leftIndex-1]结尾的最长合法子串长度
            let len = 1 + i - leftIndex + dp[leftIndex]
            dp[i+1] = len
        }
        return dp.max()!
    }

    // "()(()" 解答错误
    func longestValidParenthesesWrong(_ s: String) -> Int {
        var s = Array(s)
        // var map [Character : Character] = [")": "("]
        var stack = [Character]()
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
            // 来到这里证明栈里面有 元素
            stack.removeLast()
            // 每弹出一个 cur + 2
            cur += 2
            res = max(res, cur)
        }
        return res
    }
}
// @lc code=end

