/*
 * @lc app=leetcode.cn id=15 lang=swift
 *
 * [15] 三数之和
 */

// @lc code=start
class Solution {
    func threeSum(_ nums:[Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var res = [[Int]]()
        let nums = nums.sorted()
        // 记录上一个遍历过的值
        var last = Int.max
        for a in 0..<nums.count-2 {
            // 
            var b = a + 1, c = nums.count - 1
            if nums[a] == last {
                continue
            }
            while b < c {
                if nums[a] + nums[b] + nums[c] == 0 {
                    res.append(nums[a],nums[b],nums[c])
                    // 找到了一个组合
                    c -= 1
                    b += 1
                    // 去重
                    while b < c && nums[b] == nums[b-1] {
                        b += 1
                    }
                    while b < c && nums[c] == nums[c+1] {
                        c -= 1
                    }
                } else if nums[a] + nums[b] + nums[c] > 0 {
                    c -= 1
                } else {
                    b += 1
                }
            }
            // 记录上一个遍历过的 去重
            last = nums[a]
        }
        return res
    }
}
// @lc code=end

