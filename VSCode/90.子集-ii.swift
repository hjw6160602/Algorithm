/*
 * @lc app=leetcode.cn id=90 lang=swift
 *
 * [90] 子集 II
 */

// @lc code=start
class Solution {

    // 8 ms 73.47%
    // 13.9 MB 97.96
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var track = [Int]()
        // 先排序，让相同的元素靠在一起
        var nums = nums.sorted()
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
            // 剪枝逻辑，值相同的相邻树枝，只遍历第一条
            if i > start && nums[i] == nums[i - 1] {
                continue
            }
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

