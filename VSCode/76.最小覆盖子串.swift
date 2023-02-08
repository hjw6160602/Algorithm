/*
 * @lc app=leetcode.cn id=76 lang=swift
 *
 * [76] 最小覆盖子串
 */

// @lc code=start
class Solution {
    //    44 ms 4.19% 内存
    //    16 MB 35.48%
    func minWindow(_ s: String, _ t: String) -> String {
        // 将字符串转化为字符数组 方便下标访问
        var s = [Character](s), t = [Character](t)
        // 两个Hashmap用来统计窗口中的字符是否满足要求
        var need = [Character: Int](), window = [Character: Int]()
        
        for c in t { need[c, default: 0] += 1 }
        
        var left = 0, right = 0, matchCount = 0
        // 记录最小覆盖子串的 起始索引 以及其长度
        var start = 0, len = Int.max
        while right < s.count {
            // c是将要移入窗口的字符
            let c = s[right]
            // 扩大窗口
            right += 1
            
            // 进行窗口内数据的一系列更新
            if need[c] == nil {
                continue
            }
            window[c, default: 0] += 1
            // 窗口中字符数量达到所需数量时，匹配数+1
            if window[c] == need[c] {
                matchCount += 1
            }
            
            // 判断左侧窗口是否需要收紧
            while matchCount == need.count {
                // 这里更新最小覆盖子串
                if right - left < len {
                    start = left
                    len = right - left
                }
                // d 是将要移出窗口的字符
                let d = s[left]
                // 缩小窗口
                left += 1
                //进行窗口内数据的一系列更新
                if need[d] == nil { continue }
                // 缩小窗口如果左边界的字符统计和实际需要的相等
                // 则matchCount 需要-1 如果大于则无所谓
                if window[d] == need[d] {
                    matchCount -= 1
                }
                // 缩小窗口后 将窗口中对左边界字符的count统计-1
                window[d]! -= 1
            }
        }
        // 返回最小覆盖子串
        return (len == Int.max) ? "" : String(s[start..<(start+len)])
    }
}
// @lc code=end

