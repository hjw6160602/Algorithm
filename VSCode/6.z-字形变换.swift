/*
 * @lc app=leetcode.cn id=6 lang=swift
 *
 * [6] N 字形变换
 */

// @lc code=start
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }
    
        var res = [String](repeating: "", count: numRows)
        var i = 0, flag = -1
    
        for char in s {
            res[i] += String(char)
            if i == 0 || i == numRows - 1 {
                flag = -flag
            }
            i += flag
        }
    
        return res.joined()
    }
}
// @lc code=end

