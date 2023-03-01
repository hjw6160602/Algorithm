/*
 * @lc app=leetcode.cn id=2011 lang=swift
 *
 * [2011] 执行操作后的变量值
 */

// @lc code=start
class Solution {
    // 24 ms 56.25%
    // 14.3 MB 34.38%
    var map = ["++X": 1, "X++": 1, "--X": -1, "X--": -1,]
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        var res = 0
        for op in operations {
            if let num = map[op] {
                res += num
            }
        }
        return res
    }
}
// @lc code=end

