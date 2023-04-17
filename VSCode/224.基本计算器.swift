/*
 * @lc app=leetcode.cn id=224 lang=swift
 *
 * [224] 基本计算器
 */

// @lc code=start
class Solution {
    func calculate(_ s: String) -> Int {
        var result = 0
        var num = 0
        var sign = 1
        var stack = [sign]
        
        for char in s {
            switch char {
            case "+", "-":
                result += num * sign
                sign = stack.last! * (char == "+" ? 1 : -1)
                num = 0
            case "(":
                stack.append(sign)
            case ")":
                stack.removeLast()
            case " ":
                break
            default:
                num = num * 10 + char.wholeNumberValue!
            }
        }
        
        return result + num * sign
    }
}
// @lc code=end

