/*
 * @lc app=leetcode.cn id=303 lang=swift
 *
 * [303] 区域和检索 - 数组不可变
 */

// @lc code=start

// 72 ms 60%
// 15 MB 36.67%
class NumArray {
    // 前缀和数组
    var preSum: [Int]

    /* 输入一个数组，构造前缀和 */
    init(_ nums: [Int]) {
        // preSum[0] = 0，便于计算累加和
        self.preSum = Array(repeating: 0, count: nums.count + 1)
        // 计算 nums 的累加和
        for i in 1...nums.count {
            preSum[i] = preSum[i-1] + nums[i-1]
        }
    }
    
    /* 查询闭区间 [left, right] 的累加和 */
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return preSum[right+1] - preSum[left]
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
// @lc code=end

