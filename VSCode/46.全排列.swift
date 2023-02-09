/*
 * @lc app=leetcode.cn id=46 lang=swift
 *
 * [46] 全排列
 */

// @lc code=start
class Solution {
    /* 主函数，输入一组不重复的数字，返回它们的全排列 */
    func permute(_ nums: [Int]) -> [[Int]] {

        var res = [[Int]](), track = [Int]()
        // track 中的元素会被标记为 true
        var used = Array(repeating: false, count: nums.count)

        backtrace(nums, &used, &res, &track)
        return res
    }

    private func backtrace(_ nums: [Int], _ used: inout [Bool], _ res: inout [[Int]], _ track: inout [Int]) {
        // bace case 到达叶子节点
        if track.count == nums.count {
            // 收集叶子节点上的值
            res.append(track)
            return 
        }

        for i in 0..<nums.count {
            // 已经存在 track 中的元素，不能重复选择
            guard !used[i] else { continue }

            let num = nums[i]
            // 做选择
            track.append(num)
            used[i] = true
            // 进入下一层回溯树
            backtrace(nums, &used, &res, &track)
            // 撤销选择
            track.removeLast()
            used[i] = false
        }
    }
}
// @lc code=end

