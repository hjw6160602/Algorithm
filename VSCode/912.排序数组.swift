/*
 * @lc app=leetcode.cn id=912 lang=swift
 *
 * [912] 排序数组
 */

// @lc code=start
class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        // 归并排序对数组进行原地排序
        Merge.sort(nums)
        return nums
    }
}

class Merge {

    // 用于辅助合并有序数组
    private static var temp: [Int] = []

    public static func sort(_ nums: inout [Int]) {
        // 先给辅助数组开辟内存空间
        temp = Array(repeating: 0, count: nums.count)
        // 排序整个数组（原地修改）
        sort(&nums, 0, nums.count - 1)
    }

    // 定义：将子数组 nums[lo..hi] 进行排序
    private static func sort(_ nums: inout [Int], _ lo: Int, _ hi: Int) {
        if lo == hi {
            // 单个元素不用排序
            return
        }
        // 这样写是为了防止溢出，效果等同于 (hi + lo) / 2
        let mid = lo + (hi - lo) / 2
        // 先对左半部分数组 nums[lo..mid] 排序
        sort(&nums, lo, mid)
        // 再对右半部分数组 nums[mid+1..hi] 排序
        sort(&nums, mid + 1, hi)
        // 将两部分有序数组合并成一个有序数组
        merge(&nums, lo, mid, hi)
    }

    // 将 nums[lo..mid] 和 nums[mid+1..hi] 这两个有序数组合并成一个有序数组
    private static func merge(_ nums: inout [Int], _ lo: Int, _ mid: Int, _ hi: Int) {
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

