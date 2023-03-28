/*
 * @lc app=leetcode.cn id=134 lang=swift
 *
 * [134] 加油站
 */

// @lc code=start
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var sum = 0
        for i in 0..<gas.count {
            sum += gas[i] - cost[i]
        }
        if sum < 0 {
            return -1
        }
        // 记录起点
        var start = 0
        // 记录油箱中的油量
        var tank = 0
        for i in 0..<gas.count {
            tank += gas[i] - cost[i]
            if tank < 0 {
                tank = 0
                start = i + 1
            }
        }
        return start == n ? 0 : start
    }
}
// @lc code=end

