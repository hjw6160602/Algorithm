/*
 * @lc app=leetcode.cn id=659 lang=swift
 *
 * [659] 分割数组为连续子序列
 */

// @lc code=start
class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        // freq 记录每个元素出现的次数
        var freq = [Int: Int]()
        // need 记录哪些元素可以被接到其他子序列后面
        var need = [Int: Int]()
        // 统计 nums 中元素的频率
        for num in nums {
            freq[num, default: 0] += 1
        }

        for num in nums {
            if freq[num] == 0 {
                // 已经被用到其他子序列中
                continue
            }
            // 先判断 v 是否能接到其他子序列后面
            if need[num, default: 0] > 0 {
                freq[num]! -= 1
                need[num]! -= 1
                need[num+1, default: 0] += 1
            } else if freq[num]! > 0 && freq[num+1, default:0] > 0 && freq[num+2, default:0] > 0 {
                // 将 v 作为开头，新建一个长度为 3 的子序列 [v,v+1,v+2]
                freq[num]! -= 1
                freq[num+1]! -= 1
                freq[num+2]! -= 1
                // 对 v + 3 的需求加一
                need[num+3, default: 0] += 1
            } else {
                // 两种情况都不符合，则无法分配
                return false
            }
        }
        return true
    }
}
// @lc code=end

