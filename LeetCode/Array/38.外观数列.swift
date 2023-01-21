//
//  38.外观数列.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/3/31.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
//    8 ms 97.47%
//    13.6 MB 44.30%

    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1"}
        if n == 2 { return "11"}
        var currentSay = [Character]("11")
        
        for _ in 3...n {
            var count = 1, nextSay = [Character]()
            var lastChar = currentSay[0]
            for index in 1...currentSay.count {
                guard index != currentSay.count else {
                    nextSay.append(Character("\(count)"))
                    nextSay.append(lastChar)
                    break
                }
                if currentSay[index] == lastChar {
                    count += 1
                } else {
                    nextSay.append(Character("\(count)"))
                    nextSay.append(lastChar)
                    count = 1
                }
                lastChar = currentSay[index]
            }
            currentSay = nextSay
        }
        return String(currentSay)
    }
    
    
//    12 ms 72.15%
//    13.4 MB 93.67%
    
    func countAndSaySwift(_ n: Int) -> String {
        if n == 1 { return "1" }
        
        let previousStr = countAndSay(n - 1)
        var currentChar = previousStr.first!, currentCount = 0, res = ""
        
        for (_, char) in previousStr.enumerated() {
            if char == currentChar {
                currentCount += 1
            } else {
                res += "\(currentCount)\(currentChar)"
                
                currentCount = 1
                currentChar = char
            }
        }
        
        res += "\(currentCount)\(currentChar)"
        
        return res
    }
}

func testCountAndSay() {
    for i in 1...6 {
        let say = LeetCode.countAndSay(i)
        print(say)
    }
}
