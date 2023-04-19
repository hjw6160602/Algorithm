/*
 * @lc app=leetcode.cn id=327 lang=swift
 *
 * [327] 区间和的个数
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
        sort(&preSum)
        return count
    }
    
    func sort(_ nums: inout [Int64]) {
        temp = Array(repeating: 0, count: nums.count)
        sort(&nums, 0, nums.count - 1)
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
    func merge(_ nums: inout [Int64], _ lo: Int, _ mid: Int, _ hi: Int) {
        // 先把 nums[lo..hi] 复制到辅助数组中
        // 以便合并后的结果能够直接存入 nums
        for i in lo...hi {
            temp[i] = nums[i]
        }

        // 进行效率优化
        // 维护左闭右开区间 [start, end) 中的元素和 nums[i] 的差在 [lower, upper] 中
        var start = mid + 1, end = mid + 1;
        for i in lo...mid {
            // 如果 nums[i] 对应的区间是 [start, end)，
            // 那么 nums[i+1] 对应的区间一定会整体右移，类似滑动窗口
            while (start <= hi && nums[start] - nums[i] < lower) {
                start += 1
            }
            while (end <= hi && nums[end] - nums[i] <= upper) {
                end += 1
            }
            count += end - start
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

