/*
 * @lc app=leetcode.cn id=315 lang=swift
 *
 * [315] 计算右侧小于当前元素的个数
 */

// @lc code=start

//1708 ms 20%
//23.2 MB 20%
class CountSmaller {
    typealias Pair = (id: Int, val: Int)

    var temp: [Pair] = []
    var count: [Int] = []

    func countSmaller(_ nums: [Int]) -> [Int] {
        let n = nums.count
        count = Array(repeating: 0, count: n)
        temp = Array(repeating: Pair(0, 0), count: n)

        var arr: [Pair] = []

        for i in 0..<n {
            arr.append(Pair(i, nums[i]))
        }

        sort(&arr, 0, n - 1)
        return count
    }

    // 定义：将子数组 nums[lo..hi] 进行排序
    private func sort(_ arr: inout [Pair], _ lo: Int, _ hi: Int) {
        if lo == hi {
            // 单个元素不用排序
            return
        }
        // 这样写是为了防止溢出，效果等同于 (hi + lo) / 2
        let mid = lo + (hi - lo) / 2
        // 先对左半部分数组 nums[lo..mid] 排序
        sort(&arr, lo, mid)
        // 再对右半部分数组 nums[mid+1..hi] 排序
        sort(&arr, mid + 1, hi)
        // 将两部分有序数组合并成一个有序数组
        merge(&arr, lo, mid, hi)
    }

    // 将 nums[lo..mid] 和 nums[mid+1..hi] 这两个有序数组合并成一个有序数组
    private func merge(_ arr: inout [Pair], _ lo: Int, _ mid: Int, _ hi: Int) {
        // 先把 nums[lo..hi] 复制到辅助数组中
        // 以便合并后的结果能够直接存入 nums
        for i in lo...hi {
            temp[i] = arr[i]
        }
        // 数组双指针技巧，合并两个有序数组
        var i = lo, j = mid + 1
        for p in lo...hi {
            if i == mid + 1 {
                // 左半边数组已全部被合并
                arr[p] = temp[j]
                j += 1
            } else if j == hi + 1 {
                // 右半边数组已全部被合并
                arr[p] = temp[i]
                i += 1
                count[arr[p].id] += j - mid - 1
            } else if temp[i].val > temp[j].val {
                arr[p] = temp[j]
                j += 1
            } else {
                arr[p] = temp[i]
                i += 1
                count[arr[p].id] += j - mid - 1
            }
        }
    }
}
// @lc code=end

