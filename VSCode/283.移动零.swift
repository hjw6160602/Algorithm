/*
 * @lc app=leetcode.cn id=283 lang=swift
 *
 * [283] 移动零
 */

// @lc code=start
class Solution {
    // 124 ms 100%
    // 15 MB 30
     func moveZeroes(_ nums: inout [Int]) {
        var fast = 0, slow = 0

        while fast < nums.count {
            if nums[fast] != 0 {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        for i in slow..<nums.count {
            nums[i] = 0
        }
    }

    // 因为要保证相对顺序 所以这种 左右指针无法 使用
    func moveZeroesLR(_ nums: inout [Int]) {
        var left = 0, right = nums.count - 1

        while left < right {
            // 保证右侧指针right后面全是0
            if nums[right] == 0 {
                right -= 1
                continue
            }

            if nums[left] == 0 {
                (nums[left], nums[right]) = (nums[right], nums[left])
            }
            left += 1
        }
    }
}
// @lc code=end

