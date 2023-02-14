/*
 * @lc app=leetcode.cn id=40 lang=swift
 *
 * [40] 组合总和 II
 */

// @lc code=start
class Solution {
    // 记录 track 中的元素之和
    var trackSum = 0

    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]](), track = [Int]()
        // 先排序，让相同的元素靠在一起
        var nums = candidates.sorted()
        backtrace(candidates, 0, target, &res, &track)
        return res
    }

    // 回溯算法核心函数，遍历子集问题的回溯树
    private func backtrace(_ nums: [Int],
                           _ start: Int, 
                           _ target: Int,
                           _ res: inout  [[Int]], 
                           _ track: inout [Int]) {
        if trackSum == target {
            res.append(track)
            return
        }
        // base case，超过目标和，直接结束
        if trackSum > target {
            return
        }

        // 前序位置，每个节点的值都是一个子集

        for i in start..<nums.count {
            // 剪枝逻辑，值相同的相邻树枝，只遍历第一条
            if i > start && nums[i] == nums[i - 1] {
                continue
            }
            
            let num = nums[i]
            // 做选择
            track.append(num)
            trackSum += num
            backtrace(nums, i+1, target, &res, &track)
            // 撤销选择
            trackSum -= num
            track.removeLast()
        }
    }
}
// @lc code=end

