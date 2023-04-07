/*
 * @lc app=leetcode.cn id=140 lang=swift
 *
 * [140] 单词拆分 II
 */

// @lc code=start

class Solution {
    var res = [String]()
    var track = [String]()
    var wordDict = [String]()
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        // 执行回溯算法穷举所有可能的组合
        self.wordDict = wordDict
        backtrace(s, 0)
        return res
    }
    
    // 回溯算法框架
    private func backtrace(_ s: String, _ i: Int) {
        // base case
        if i == s.count {
            // 找到一个合法组合拼出整个 s，转化成字符串
            res.append(track.joined(separator: " "))
            return
        }
        for word in wordDict{
            // 看看哪个单词能够匹配 s[i..] 的前缀
            let len = word.count
            if i + len <= s.count,
               s[i..<i+len] == word {
                // 找到一个单词匹配 s[i..i+len)
                // 做选择
                track.append(word)
                // 进入回溯树的下一层，继续匹配 s[i+len..]
                backtrace(s, i + len)
                // 撤销选择
                track.removeLast()
            }
        }
    }
}

class Solution {
    var cache = [String: [String]]()
    // 回溯法 拆分字符串直到最后一节字符串 
    // 比较是否和字典中的字数相等来判断是否作为res返回给上一级 
    // 注意 如果我们把每次结果添加到结果缓存里 那么针对aaa...aaa这种特殊情况就会优化很多
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        if let ans = cache[s] {
            return ans
        }
        var res = [String]() 

        for w in wordDict {
            if s.hasPrefix(w) { 
                if s.count == w.count {
                    res.append(w)
                } else {
                    let substr = String(s[w.endIndex...])
                    // 进入回溯树的下一层，继续匹配 s[i+len..]
                    let subwordArr = wordBreak(substr, wordDict) 
                    // 退出回溯选择后 将后面的结果数组 前面全部添加当前word
                    for sWord in subwordArr {
                        res.append(w + " " + sWord)
                    }
                }
            }
        }
        cache[s] = res
        return res
    }
}
// @lc code=end

