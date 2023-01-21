//
//  03. 无重复字符的最长子串.swift
//  String
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
//  https://leetcode-cn.com/problems/longest-substring-without-repeating-characters

import Foundation

extension Solution {
    
//    40 ms 19.91%
//    14.1 MB 87.59%
    func lengthOfLongestSubstringVS(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var res = 1
        
        var subString = [Character]()
        
        for char in s {
            if subString.count == 0 {
                subString = [char]
                continue
            }
            
            subString.append(char)
            
            for i in (0..<subString.count-1).reversed() {
                let subChar = subString[i]
                if subChar == char {
                    subString = [Character](subString[i+1..<subString.count])
                    break
                }
            }
            res = max(res, subString.count)
        }
        return res
    }
    
    
    // MARK: - 类似DP
    // 执行用时：16 ms 击败了 72.69%
    // 内存消耗：14.5 MB 击败了 5.10%
    // 通过测试用例：987 / 987
    func lengthOfLongestSubstringLow(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        
        // 上一次出现相同字符的索引index [key: value] [String: Int]
        var preIndexMap = [Character: Int]()
        
        typealias Tuple = (start: Int, end: Int)
        
        // 用来存储 每一个以当前字符结尾的最长不重复子串
        var maxLenList = Array(repeating: Tuple(0, 1), count: s.count)
        
        // 以index -1 结尾的 最长不重复子串的索引
        var maxLen = 1
        for (index, char) in s.enumerated() {
            guard index > 0 else {
                preIndexMap[char] = 0
                continue
            }
            
            // 确定当前字符上一次出现的Index
            var pi = -1
            if let duplicate = preIndexMap[char] {
                pi = duplicate
            }
            // 更新 字符索引的map为当前index
            preIndexMap[char] = index
            
            let li = maxLenList[index - 1].start
            if pi < li { // li 在pi的右边：
                // pi [li  i-1] i
                // D         A  D
                maxLenList[index] = Tuple(li, index)
            } else { // li 在Pi的左边 或相等
                // [li pi i-1] i
                //  D       A  D
                maxLenList[index] = Tuple(pi + 1, index)
            }

//            print(s[maxLenList[index].start...index])
            maxLen = max(maxLen, index - maxLenList[index].start + 1)
        }
        
        return maxLen
    }
    
    //    执行用时：16 ms 击败了 72.69%
    //    内存消耗：14 MB 击败了 41.50%
    func lengthOfLongestSubstringO1(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        
        // 上一次出现相同字符的索引index [key: value] [String: Int]
        var preIndexMap = [Character: Int]()
        
        var li = 0, maxLen = 1
        for (index, char) in s.enumerated() {
            guard index > 0 else {
                preIndexMap[char] = 0
                continue
            }
            // 确定当前字符上一次出现的Index
            var pi = -1
            if let duplicate = preIndexMap[char] {
                pi = duplicate
            }
            // 更新 字符索引的map为当前index
            preIndexMap[char] = index
            
            if pi >= li {
                li = pi + 1
            }
            print(s[li...index])
            maxLen = max(maxLen, index - li + 1)
        }
        
        return maxLen
    }
    
//    执行用时：8 ms      97.94%
//    内存消耗：13.8 MB   71.12%
    func lengthOfLongestSubstringO2(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        
        // 上一次出现相同字符的索引index
        var preIndexMap = Array(repeating: -1, count: 128)
        
        var start = 0, maxLen = 1
        for (index, char) in s.enumerated() {
            let ascii = Int(char.asciiValue!)
            
            guard index > 0 else {
                preIndexMap[ascii] = 0
                continue
            }
            
            if  preIndexMap[ascii] >= start {
                start = preIndexMap[ascii] + 1
            }
            // 更新 字符索引的map为当前index
            preIndexMap[ascii] = index
            
            print(s[start...index])
            maxLen = max(maxLen, index - start + 1)
        }
        
        return maxLen
    }
    
    //    执行用时：12 ms  90.41%
    //    内存消耗：4.1 MB 26.21%
    func lengthOfLongestSubstringSwift(_ s: String) -> Int {
        var maxLen = 0, startIdx = 0, preIndexMap = [Character: Int]()
        
        for (i, char) in s.enumerated() {
            if let pos = preIndexMap[char] {
                startIdx = max(startIdx, pos)
            }
            
            // update to next valid position
            preIndexMap[char] = i + 1
            maxLen = max(maxLen, i - startIdx + 1)
        }
        
        return maxLen
    }
    
//    执行用时：4 ms 99.51% 、90.12%
//    内存消耗：14 MB 42.84% 、66.38%
    func lengthOfLongestSubstringO3(_ s: String) -> Int {
        // 上一次出现相同字符的索引index
        var start = 0, maxLen = 0, preIndexMap = Array(repeating: -1, count: 128)
        
        for (idx, char) in s.enumerated() {
            let ascii = Int(char.asciiValue!)
            start = max(start, preIndexMap[ascii])
            // 更新 字符索引的map为当前index
            preIndexMap[ascii] = idx + 1
//            print(s[start...idx])
            maxLen = max(maxLen, idx - start + 1)
        }
        return maxLen
    }

}

func test03LengthOfLongestSubstring() {
    let string = ""
    let x = Solution.shared.lengthOfLongestSubstringVS(string)
    print(x)
}

//给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。

//示例 1:
//输入: s = "abcabcbb"
//输出: 3
//解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

//示例 2:
//输入: s = "bbbbb"
//输出: 1
//解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。

//示例 3:
//输入: s = "pwwkew"
//输出: 3
//解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
//     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

//示例 4:
//输入: s = ""
//输出: 0

//提示：

//0 <= s.length <= 5 * 104
//s 由英文字母、数字、符号和空格组成
