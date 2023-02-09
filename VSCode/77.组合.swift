/*
 * @lc app=leetcode.cn id=77 lang=swift
 *
 * [77] 组合
 */

// @lc code=start
class Solution {
     
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        var track = [Int]()
        
        backtrace(n, k, 1, &res, &track)
        
        return res
    }
    
    func backtrace(_ n: Int, _ k: Int, _ start: Int,_ res: inout [[Int]], _ track: inout [Int]) {
        // 递归基
        if track.count == k {
            // 遍历到了第 k 层，收集当前节点的值
            res.append(track)
            return
        }
        // Swift语法问题 不写这行会到这start大于n的Range崩溃
        guard start <= n else { return }
        
        for i in start...n {
            // 选择
            track.append(i)
            // 通过 start 参数控制树枝的遍历，避免产生重复的子集
            backtrace(n, k , i+1, &res, &track)
            // 撤销选择
            track.removeLast()
        }
    }
}
// @lc code=end

