//
//  03. 无重复字符的最长子串.swift
//  String
//
//  Created by WillJay on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
//  https://leetcode-cn.com/problems/longest-substring-without-repeating-characters


// @lc code=start

class Solution {
    //    40 ms 19.91%
    //    14.1 MB 87.59%
    func lengthOfLongestSubstring(_ s: String) -> Int {
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
}

extension String {
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }1
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start..<end])
    }

    subscript (r: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start...end])
    }
}

// @lc code=end

