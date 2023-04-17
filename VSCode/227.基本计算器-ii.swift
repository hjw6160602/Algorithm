/*
 * @lc app=leetcode.cn id=227 lang=swift
 *
 * [227] 基本计算器 II
 */

// @lc code=start
class Solution {
func calculate(_ s: String) -> Int {
    var s = s

    func helper(_ s: inout String) -> Int {
        var stack = [Int]()
        var sign: Character = "+"
        var num = 0
        
        while !s.isEmpty {
            let c: Character = s.removeFirst()
            if c.isNumber {
                num = 10 * num + Int(String(c))!
            }

            // 遇到左括号开始递归计算 num
            if c == "(" {
                num = helper(&s)
            }
            
            if (!c.isNumber && c != " ") || s.isEmpty {
                switch sign {
                case "+":
                    stack.append(num)
                case "-":
                    stack.append(-num)
                default:
                    break
                }
                num = 0
                sign = c
            }
            // 遇到右括号返回递归结果
            if c == ")" { break }
        }
        return stack.reduce(0, +)
    }
    return helper(&s)
}
}
// @lc code=end

