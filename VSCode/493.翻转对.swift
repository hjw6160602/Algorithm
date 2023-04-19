/*
 * @lc app=leetcode.cn id=493 lang=swift
 *
 * [493] 翻转对
 */

// @lc code=start
class Solution {
    var lower = 0
    var upper = 0
    var count = 0
    var temp: [Int64] = []

    func countRangeSum(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        self.lower = lower
        self.upper = upper
        let n = nums.count
        var preSum: [Int64] = Array(repeating: 0, count: n + 1)
        // 构建前缀和数组，注意 int 可能溢出，用 Int64 存储
        for i in 0..<n {
            preSum[i+1] = Int64(nums[i]) + preSum[i]
        }
        sort(&preSum, 0, n)
        return count
    }
    // 标准排序算法
    func sort(_ nums: inout [Int64], _ lo: Int, _ hi: Int) {
        if lo == hi {
            return
        }
        let mid = lo + (hi - lo) / 2
        sort(&nums, lo, mid)
        sort(&nums, mid+1, hi)
        merge(&nums, lo, mid, hi)
    }

    // 合并函数
    func merge(_ nums: inout [Int], _ lo: Int, _ mid: Int, _ hi: Int) {
        // 先把 nums[lo..hi] 复制到辅助数组中
        // 以便合并后的结果能够直接存入 nums
        for i in lo...hi {
            temp[i] = nums[i]
        }
        // 数组双指针技巧，合并两个有序数组
        var i = lo, j = mid + 1
        for p in lo...hi {
            if i == mid + 1 {
                // 左半边数组已全部被合并
                nums[p] = temp[j]
                j += 1
            } else if j == hi + 1 {
                // 右半边数组已全部被合并
                nums[p] = temp[i]
                i += 1
            } else if temp[i] > temp[j] {
                nums[p] = temp[j]
                j += 1
            } else {
                nums[p] = temp[i]
                i += 1
            }
        }
    }
}
// @lc code=end

