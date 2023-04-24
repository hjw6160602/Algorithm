/*
 * @lc app=leetcode.cn id=493 lang=swift
 *
 * [493] 翻转对
 */

// @lc code=start

// 884 ms
// 15.8 MB 50%
class Solution {
    // 记录「翻转对」的个数
    var count = 0
    var temp: [Int] = []

    func reversePairs(_ nums: [Int]) -> Int {
        var nums = nums
        sort(&nums)
        return count
    }
    
    func sort(_ nums: inout [Int]) {
        temp = Array(repeating: 0, count: nums.count)
        sort(&nums, 0, nums.count - 1)
    }
    
    // 归并排序
    func sort(_ nums: inout [Int], _ lo: Int, _ hi: Int) {
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

        // 进行效率优化，维护左闭右开区间 [mid+1, end) 中的元素乘 2 小于 nums[i]
        // 为什么 end 是开区间？因为这样的话可以保证初始区间 [mid+1, mid+1) 是一个空区间
        var end = mid + 1

        for i in lo...mid {
            // nums 中的元素可能较大，乘 2 可能溢出，所以转化成 Int64
            while end <= hi && nums[i] > nums[end] * 2 {
                end += 1
            }
            count += end - (mid + 1)
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

