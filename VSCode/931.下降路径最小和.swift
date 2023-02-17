/*
 * @lc app=leetcode.cn id=931 lang=swift
 *
 * [931] 下降路径最小和
 */

// @lc code=start
class Solution {
    //    80 ms 71.43%
//    14 MB 50%
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let m = matrix.count, n = matrix[0].count

//      我们 DP 的初始值就要避开区间 [-10000, 10000]，
//      DP 的初始值只要在区间 (-inf, -10001] U [10001, +inf) 中就可以
//      这里dp数组的行数确立为和 matrix的行数一样为m，列数比matrix多2列
//      是为了防止后面在取值的时候的一个数组越界的问题 方便动态转移方程的转移
        var dp = Array(repeating: Array(repeating: 10001, count: n+2),
                       count: m)

        // 初始化第一行DP数组
        for j in 1...n {
            dp[0][j] = matrix[0][j-1]
        }

        for i in 1..<m {
            for j in 1...n {
                // 注意dp数组中的列数是0...n+1 而 对应有统计的matrix的列数是1...n 
                dp[i][j] = min(
                        dp[i-1][j-1], dp[i-1][j], dp[i-1][j+1]
                    ) + matrix[i][j-1]
                // 注意最后加的这个值 在原始矩阵中对应的列索引为j-1
            }
        }
        
//      刚才说了，合法答案的区间是 [-10000, 10000]，
//      所以我们的返回值只要大于 10000 就相当于一个永不会取到的最大值。
        var res = 10001
        for k in 1...n {
            // 注意这里取的是最小值，最大值只要在区间外即可
            res = min(res, dp[m-1][k])
        }
        return res
    }
}
// @lc code=end

