/*
 * @lc app=leetcode.cn id=921 lang=swift
 *
 * [921] 使括号有效的最少添加
 */

// @lc code=start
class Solution {
    // 4 ms 16.67%
    // 13.9 MB 50%
    func minAddToMakeValid(_ s: String) -> Int {
        let s = Array(s)
        // res 记录插入次数
        var res = 0
        // need 变量记录右括号的需求量
        var need = 0
        for char in s {
            if char == "(" {
                // 对右括号的需求 + 1
                 need += 1
                 continue
            }
            // 来到这里证明char == ")"
            // 对右括号的需求 - 1
            need -= 1
            if need == -1 {
                // 意味着右括号太多了，所以需要插入左括号。
                need = 0
                // 需要插入一个左括号
                res += 1
            }
        }
        return res + need
    }

    // 4 ms 16.67%
    // 14 MB 16.67%
    func minAddToMakeValidOld(_ s: String) -> Int {
        var s = Array(s)
        var stack = [Character]()
        var res = 0
        for char in s {
            if char == "(" {
                stack.append(char)
                continue
            }
            // 来到这里证明char == ")"
            if let last = stack.last {
                stack.removeLast()
            } else {
                // 将左边加入一个 "("
                res += 1
            }
        }
        return res + stack.count
    }
}
// @lc code=end

