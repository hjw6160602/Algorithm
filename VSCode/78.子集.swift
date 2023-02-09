/*
 * @lc app=leetcode.cn id=78 lang=swift
 *
 * [78] 子集
 */

// @lc code=start
class Solution {
    // 4 ms 96.84%
    // 14.1 MB 42.11%
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var track = [Int]()
        backtrace(nums, 0, &res, &track)
        return res
    }

    // 回溯算法核心函数，遍历子集问题的回溯树
    private func backtrace(_ nums: [Int],
                           _ start: Int, 
                           _ res: inout  [[Int]], 
                           _ track: inout [Int]) {
        // 前序位置，每个节点的值都是一个子集
        res.append(track)
        for i in start..<nums.count {
            // 做选择
            let num = nums[i]
            track.append(num)
            backtrace(nums, i+1, &res, &track)

            // 撤销选择
            track.removeLast()
        }
    }
}
// @lc code=end

