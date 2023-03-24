/*
 * @lc app=leetcode.cn id=301 lang=swift
 *
 * [301] 删除无效的括号
 */

// @lc code=start
class Solution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        var left = 0, right = 0
        // 统计左右括号个数的不平衡因子
        for char in s {
            if char == "(" {
                left += 1
            } else if char == ")" {
                if left > 0 {
                    left -= 1
                } else {
                    right += 1
                }
            }
        }
        // 利用字符串数组判重
        var res = Set<String>()
        dfs(Array(s), 0, left, right, &res)
        return Array(res)
    }
    
    // 回溯递归求解
    func dfs(_ s: [Character], _ index: Int, _ left: Int, _ right: Int, _ res: inout Set<String>) {
        // 如果左右平衡了，那么去验证其合法性
        if left == 0 && right == 0 {
            if isValid(s) {
                // 如果合法，那么将结果插入到结果集合
                res.insert(String(s))
            }
            return
        }
        //
        for i in index..<s.count {
            // 如果当前字符和上一个字符一样，那么先跳过
            if i > index && s[i] == s[i-1] {
                continue
            }
            // 如果是左括号不平衡因子大，那么去移除当前的左括号
            if s[i] == "(" && left > 0 {
                var temp = s
                temp.remove(at: i)
                // 移除后 不平衡因子left - 1
                dfs(temp, i, left-1, right, &res)
            }
            // 如果是右括号不平衡因子大，那么去移除当前的右括号
            if s[i] == ")" && right > 0 {
                var temp = s
                temp.remove(at: i)
                // 移除后 不平衡因子right - 1
                dfs(temp, i, left, right-1, &res)
            }
        }
    }
    /// 验证是否合法
    func isValid(_ s: [Character]) -> Bool {
        var count = 0
        for char in s {
            // 统计左括号个数
            if char == "(" {
                count += 1
            } else if char == ")" {
                // 如果遇到右括号 就进行-1操作
                count -= 1
                // 如果遇到右括号个数比左括个数多，那么直接返回false
                if count < 0 {
                    return false
                }
            }
        }
        return count == 0
    }
}
// @lc code=end

