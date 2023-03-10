/*
 * @lc app=leetcode.cn id=304 lang=swift
 *
 * [304] 二维区域和检索 - 矩阵不可变
 */

// @lc code=start

//    2228 ms 5.88%
//    17.1 MB 64.71%
class NumMatrix {

    var preSum = [[Int]]()

    init(_ matrix: [[Int]]) {
        let m = matrix.count, n = matrix[0].count

        if m == 0 || n == 0 { return }
        // 注意Swift里面的二维数组行数和列数的 定义位置
        preSum = Array(repeating: Array(repeating: 0, count: n+1),
                       count: m+1)

        for i in 1...m {
            for j in 1...n {
                preSum[i][j] = preSum[i-1][j] + preSum[i][j-1] - preSum[i-1][j-1] + matrix[i-1][j-1]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return preSum[row2+1][col2+1] - preSum[row1][col2+1] - preSum[row2+1][col1] + preSum[row1][col1]
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
// @lc code=end

