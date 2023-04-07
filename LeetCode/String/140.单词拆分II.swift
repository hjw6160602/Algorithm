//
//  140.单词拆分II.swift
//  String
//
//  Created by 贺嘉炜 on 2023/4/2.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func test140WordBreak() {
    //    let s = "apple", wordDict = ["apple", "pen"]
    let s = "catsanddog", wordDict = ["cat","cats","and","sand","dog"]
    let x = SolutionII().wordBreak(s, wordDict)
    print(x)
}

//    4 ms 50%
//    14.2 MB 50%
class SolutionII {
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
