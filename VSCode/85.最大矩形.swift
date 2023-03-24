/*
 * @lc app=leetcode.cn id=85 lang=swift
 *
 * [85] 最大矩形
 */

// @lc code=start
class Solution {
    //    188 ms 100%
//    14.8 MB 60%
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        var res = 0
        var heights = Array(repeating: 0, count: matrix[0].count)
        for row in 0..<matrix.count {
            //遍历每一列，更新高度
            for col in 0..<matrix[0].count {
                if (matrix[row][col] == "1") {
                    // 当前层为1 在上一层基础上高度+1
                    heights[col] += 1;
                } else {
                    // 当前层出现了0 直接恢复高度到0
                    heights[col] = 0;
                }
            }
            //调用最大矩阵面积的解法，更新函数
            res = max(res, largestArea(heights));
        }
        return res
    }
    
    func largestArea(_ heights: [Int]) -> Int {
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
}
// @lc code=end

