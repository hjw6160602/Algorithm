/*
 * @lc app=leetcode.cn id=10 lang=swift
 *
 * [10] 正则表达式匹配
 */

// @lc code=start
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        return dp(Array(s), 0, Array(p), 0)
    }
    
    var memo = [String: Bool]()
    
    private func dp(_ s: [Character], _ i: Int,
                    _ p: [Character], _ j: Int) -> Bool {
        let m = s.count, n = p.count
        // base case
        if j == n {
            return i == m
        }
        // 如果s匹配完了但是p没有匹配完毕可以让p后面所有的字符匹配0就好
        if i == m {
            // 枝剪如果后面剩余的串长度不是偶数 直接返回false
            if (n - j) % 2 == 1 {
                return false
            }
            var k = j
            while k + 1 < n {
                if p[k+1] != "*" {
                    // 只要发现一个后面接着的不是* 就返回false
                    return false
                }
                k += 2
            }
            // 如果后面的串都能匹配成功，则返回true
            return true
        }
        // 记录(i,j)的状态，消除重叠子问题
        let key = "\(i),\(j)"
        if memo[key] != nil {
            return memo[key]!
        }
        var res = false
        if s[i] == p[j] || p[j] == "." {
            // 匹配相等的情况下
            if j < n - 1 && p[j+1] == "*" {
                // 匹配0次则是i不动j+2，匹配多次则是j不动i+1
                res = dp(s,i,p,j+2) || dp(s,i+1,p,j)
            } else {
                // 没有*号， 则i,j同时+1
                res = dp(s,i+1,p,j+1)
            }
        } else {
            // 匹配不相等的情况下
            if j < n-1 && p[j+1] == "*" {
                // 可以用p[j]位置的出现0次来略过这次不相等
                res = dp(s,i,p,j+2)
            } else {
                // 匹配失败并且无法略过，那么返回false
                res = false
            }
        }
        // 将当前结果记入备忘录
        memo[key] = res
        return res
    }
}
// @lc code=end

