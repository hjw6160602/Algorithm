/*
 * @lc app=leetcode.cn id=710 lang=swift
 *
 * [710] 黑名单中的随机数
 */

// @lc code=start

// 聪明的解法类似380题380. O(1) 时间增删获取随机元素
class Solution {
    let size: Int
    // 利用hash表快速找到映射关系
    var map = [Int: Int]()

    // 我们可以将区间 [0,N) 看做一个数组，
    // 然后将 blacklist 中的元素移到数组的最末尾，同时用一个哈希表进行映射
    init(_ n: Int, _ blacklist: [Int]) {
        self.size = n - blacklist.count
        var j = n - 1
        for b in blacklist {
            map[b] = -1
        }
        // 如果 b 已经在区间 [sz, N)
        // 可以直接忽略
        for b in blacklist where b < size {
            // 将 blacklist 中的元素移到数组的最末尾
            while map[j] == -1 {
                j -= 1
            }
            map[b] = j
            j -= 1
        }
    }

    func pick() -> Int {
        let r = Int.random(in: 0..<size)
        if let val = map[r] {
            return val
        }
        return r
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(n, blacklist)
 * let ret_1: Int = obj.pick()
 */
// @lc code=end

