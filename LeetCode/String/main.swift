//
//  main.swift
//  String
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//

import Foundation

let LeetCode = Solution.shared

class Solution {
    static let shared = Solution()
    
    private init() {}
}

//testTwoSum()

//testStringRotation()
//testReversingString()
//testMyAtoi()
//testReverseURL()
//testShortestToChar()
//testAddStrings()
//testLongestCommonPrefix()

//testReverseWords()
//testIsAnagram()
test03LengthOfLongestSubstring()
//testMinDistance()
//testLongestPalindrome()
//testIndexOf()
//testRomanToInt()
//testIsSubsequence()
//testAddBinary()
//test686repeatedStringMatch()
//test409LongestPalindrome()
//test709ToLowerCase()
//test387FirstUniqChar()
//test125IsPalindrome()
//test412FizzBuzz()
//test139WordBreak()

extension String {
    
    func display(range : ClosedRange<Int>) {
        let start = index(startIndex, offsetBy:  range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        
        print(self[start...end])
    }

    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
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

//extension String {
//    subscript (r: ClosedRange<Int>) -> String {
//        let start = index(startIndex, offsetBy: r.lowerBound)
//        let end = index(startIndex, offsetBy: r.upperBound)
//        return String(self[start...end])
//    }
//}
