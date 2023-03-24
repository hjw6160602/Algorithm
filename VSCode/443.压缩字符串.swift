/*
 * @lc app=leetcode.cn id=443 lang=swift
 *
 * [443] 压缩字符串
 */

// @lc code=start
class Solution {
    // 28 ms 20%
    // 14 MB 80%
    func compress(_ chars: inout [Character]) -> Int {
        var count = 1
        var index = 0
        for i in 1..<chars.count {
            if chars[i] == chars[i-1] {
                count += 1
            } else {
                chars[index] = chars[i-1]
                index += 1
                if count > 1 {
                    let countStr = String(count)
                    for c in countStr {
                        chars[index] = c
                        index += 1
                    }
                }
                count = 1
            }
        }
        chars[index] = chars[chars.count-1]
        index += 1
        if count > 1 {
            let countStr = String(count)
            for c in countStr {
                chars[index] = c
                index += 1
            }
        }
        return index
    }

    func compress(_ chars: inout [Character]) -> Int {
        guard chars.count > 1 else {
            return 1
        }
        var count = 1
        var compress = [Character]()
        for i in 1..<chars.count {
            if chars[i-1] == chars[i] {
                count += 1
            } else {
                compress.append(chars[i-1])
                if count > 1 {
                    compress += Array(String(count))
                    count = 1
                }
            }
        }
        compress.append(chars.last!)
        if count > 1 {
            compress += Array(String(count))
        }
        chars = compress
        return compress.count
    }
}
// @lc code=end

