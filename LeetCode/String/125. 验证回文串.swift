//
//  125. 验证回文串.swift
//  String
//
//  Created by 贺嘉炜 on 2022/7/30.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
//    16 ms 41.86%
//    15.8 MB 37.21%
    func isPalindrome(_ s: String) -> Bool {
        var i = 0, j = s.count - 1
        let sChars = Array(s.lowercased())
        print(String(sChars))
        while i < j {
            while !sChars[i].isValid && i < j {
                i += 1
            }
            while !sChars[j].isValid && i < j {
                j -= 1
            }
            if sChars[i] != sChars[j] {
                return false
            } else {
                i += 1
                j -= 1
            }
        }
        return true
    }
}

extension Character {
    var isValid: Bool {
        return isNumber || isLetter
    }
}

func test125IsPalindrome() {
//    let s = "A man, a plan, a canal: Panama"
    let s = "0b"
    let x = LeetCode.isPalindrome(s)
    print(x)
}
