/*
 * @lc app=leetcode.cn id=34 lang=swift
 *
 * [34] 在排序数组中查找元素的第一个和最后一个位置
 */

// @lc code=start
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [-1, -1]
        var l = 0, r = nums.count
        // 区间左闭右开[l, r)
        while l < r {
            var mid = l + (r - l) >> 1 
            if mid == target {
                // 已经找到了 数组中的数字
                // 相等的时候要分别再去寻找左右边界
                var lm =  mid, rm =  mid 
                while l < lm {  
                    let tmp = l + (lm - l) >> 1
                    if nums[tmp] != target {
                        l = tmp
                    } else {
                        lm = tmp
                    }
                }

                while rm < r {
                    let tmp =  rm + (r - rm) >> 1 
                    if nums[tmp] != target {
                        r = tmp - 1
                    } else {
                        rm = tmp
                    }
                }
                res = [lm, rm]
                
            } else if nums[mid] > target {
                r = mid
            } else if nums[mid] < target {
                l = mid + 1
            }
        }
        return res
    }
}
// @lc code=end

