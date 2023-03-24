/*
 * @lc app=leetcode.cn id=686 lang=swift
 *
 * [686] 重复叠加字符串匹配
 */

// @lc code=start
class Solution {
    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        var repeated = a
        var count = 1
        while repeated.count < b.count {
            repeated += a
            count += 1
        }
        if repeated.contains(b) {
            return count
        }
        repeated += a
        count += 1
        if repeated.contains(b) {
            return count
        }
        return -1
    }

    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        

        var a = Array(a), b = Array(b)

        var origin = Array(repeating:0, count:26)
        var target = origin

        for aChar in a {
            let i = Int(aChar.asciiValue!) - 97
            origin[i] += 1
        }
        for bChar in b {
            let j = Int(bChar.asciiValue!) - 97
            target[j] += 1
        }

        var times = 0
        for i in 0..<26 {
            if target[i] > 0 {
                if origin[i] == 0 {
                    return -1
                }
                times = max(times, target[i] - origin[i] + 1)
            }
        }
        var aa = [Character]() 
        for i in times {
            aa += a
        }
        var bb = aa + a 
        if aa.contains(b) {
            return times
        } else {
            return times + 1
        }
    }
}
// @lc code=end

