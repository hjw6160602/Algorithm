/*
 * @lc app=leetcode.cn id=378 lang=swift
 *
 * [378] 有序矩阵中第 K 小的元素
 */

// @lc code=start
class Solution {
    func kthSmallest(_ matrix :[[Int]], _ k : Int) -> Int {
        let n = matrix.count
        var left = matrix[0][0], right = matrix[n - 1][n - 1]
        // 二分搜索
        while (left < right) {
            let mid = left + ((right - left) >> 1)
            if (check(matrix, mid, k, n)) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    // 我们可以看到，矩阵中大于 mid 的数就和不大于 mid 的数分别形成了两个板块，
    // 沿着一条锯齿线将这个矩形分开。其中左上角板块的大小即为矩阵中不大于 mid 的数的数量。
    // 该函数返回对于传入的 mid 数值 返回是否 满足 矩阵左上角板块中有大于等于k个数
    func check(_ matrix :[[Int]], _ mid : Int, 
               _ k : Int, _ n :Int) -> Bool {
        var i = n - 1, j = 0, num = 0
        // 先从左下角开始尝试划线
        while (i >= 0 && j < n) {
            if (matrix[i][j] <= mid) {
                // 如果当前位置的值小那么往右走
                j += 1
                // 每往右走一步那么把当前列上部的所有元素都加入求和统计
                num += i + 1
            } else {
                // 如果当前位置的值大那么往上走
                i -= 1
            }
        }
        // 返回是否 满足 矩阵左上角板块中有大于等于k个数
        return num >= k
    }
}
// @lc code=end

