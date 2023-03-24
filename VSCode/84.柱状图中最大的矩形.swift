/*
 * @lc app=leetcode.cn id=84 lang=swift
 *
 * [84] 柱状图中最大的矩形
 */

// @lc code=start
class Solution {
    //    652 ms 77.78%
//    18.1 MB 33.33
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var heights = [0] + heights + [0], stack: [Int] = [0], res = 0
        for (i, height) in heights.enumerated() {
            while heights[stack.last!] > height {
                // area = width * height 注意这里必选先算高度 才能压缩到一行
                res = max(res, heights[stack.removeLast()] * (i - stack.last! - 1))
            }
            stack.append(i)
        }
        return res
    }

    // 超出时间限制 95/98
    func largestRectangleAreaWrong(_ heights: [Int]) -> Int {
        let n = heights.count
//        var areas = Array(repeating: 0, count: n)
        var res = 0
        for k in 0..<heights.count {
            let height = heights[k]
            var i = k-1, j = k+1
            
            while i >= 0 && height <= heights[i] {
                i -= 1
            }
            while j < n && height <= heights[j] {
                j += 1
            }
            let area = (j - i - 1) * height
            res = max(res, area)
//            areas[k] = area
        }
        return res
    }
}
// @lc code=end

