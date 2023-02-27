/*
 * @lc app=leetcode.cn id=204 lang=swift
 *
 * [204] 计数质数
 */

// @lc code=start
class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else {
            return 0
        }
        
        // init isPrime bool array
        var isPrime = Array(repeating: true, count: n)
        isPrime[0] = false
        isPrime[1] = false
        
        // count prime number
        var count = 0
        for num in 2..<n {
            guard isPrime[num] else {
                continue
            }
            
            count += 1
            // 如果当前是素数
            var nextNum = num * num
            // 就把从 i*i 开始，i 的所有倍数都设置为 false。
            while nextNum < n {
                isPrime[nextNum] = false
                nextNum += num
            }
        }
        
        return count
    }
}
// @lc code=end

