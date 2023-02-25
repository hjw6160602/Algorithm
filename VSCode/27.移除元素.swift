/*
 * @lc app=leetcode.cn id=27 lang=swift
 *
 * [27] 移除元素
 */

// @lc code=start
class Solution {
    // 左右指针
    func removeElementO1(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        var slow = 0, fast = nums.count - 1
        
        while slow < fast {
            if nums[fast] == val {
                fast -= 1
                continue
            }

            if nums[slow] != val {
                slow += 1
                continue
            }

            // 交换元素思路
            (nums[slow], nums[fast]) = (nums[fast], nums[slow])
            // 换完之后slow没动 所以不能进行slow +1 操作
        }
        return (nums[slow] == val) ? slow : fast + 1
    }

    // 快慢指针
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var fast = 0, slow = 0
        while fast < nums.count {
            if nums[fast] != val {
                // 维护一个 0...slow 范围的不包含value的数组
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1 
        }
        return slow
    }


}
// @lc code=end

