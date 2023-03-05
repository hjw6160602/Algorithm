/*
 * @lc app=leetcode.cn id=1541 lang=swift
 *
 * [1541] 平衡括号字符串的最少插入次数
 */

// @lc code=start
class Solution {
//    28 ms 5%
//    15.9 MB
    func minInsertions(_ s: String) -> Int {
        let s = Array(s)
        var res = 0, need = 0
        for i in 0..<s.count {
            if s[i] == "(" {
                need += 2
                // 当遇到左括号时，若对右括号的需求量为奇数，
                // 需要在当前s[i]的前面位置插入 1 个')' 这里是本题的难点
                if need & 1 == 1 {
                    // 插入一个')'
                    res += 1
                    // 对')'的需求减一
                    need -= 1
                }
                continue
            }
            // 来到这里证明 s[i] == ')'
            need -= 1
            if need == -1 {
//                意味着我们遇到一个多余的右括号，显然需要插入一个左括号
                res += 1
                // 这里还需要对右边增加一个')'才行所以need需要恢复为1
                need = 1
            }
        }
        return res + need
    }
}
// @lc code=end

