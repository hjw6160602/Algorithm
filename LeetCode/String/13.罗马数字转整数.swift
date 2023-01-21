//
//  13.罗马数字转整数.swift
//  String
//
//  Created by 贺嘉炜 on 2022/4/3.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    16 ms 76.89%
//    14 MB 63.44%
    
    func romanToInt(_ s: String) -> Int {
        let romanMap: [String: Int] = [
            "I": 1,  "IV": 4,  "V": 5,  "IX": 9,
            "X": 10, "XL": 40, "L": 50, "XC": 90,
            "C": 100,"CD": 400,"D": 500,"CM": 900,
            "M": 1000
        ]
        
        
        var separator = [String]()
        var needContinue = false
        for (index, char) in s.enumerated() {
            // 如果遇到了combo 那么字节跳过一个字节
            guard !needContinue else {
                needContinue = false
                continue
            }
            let current = "\(char)"
            let needGlance = (current == "I" || current == "X" || current == "C")
            
            guard needGlance else {
                // 如果不需要向后看一位 那么直接加进去
                separator.append(current)
                continue
            }
            guard index + 1 < s.count else {
                separator.append(current)
                break
            }
            
            let combo = current + s[index + 1]
            guard romanMap[combo] != nil else {
                // 来到这里证明没找到
                separator.append(current)
                continue
            }
            // 来到这里证明找到了
            separator.append(combo)
            needContinue = true
        }
        var sum = 0
        for romaStr in separator {
            guard let num = romanMap[romaStr] else {
                return 0
            }
            sum += num
        }
        return sum
    }
    
//    20 ms 54.20%
//    14.2 MB 51.26%
    func romanToIntSwift(_ s: String) -> Int {
        let dict = initDict()
        let chars = [Character]([Character](s).reversed())
        var res = 0
        
        for i in 0..<chars.count {
            
            guard let current = dict[chars[i]] else {
                return res
            }
            if i > 0 && current < dict[chars[i - 1]]! {
                res -= current
            } else {
                res += current
            }
        }
        
        return res
    }
    
    private func initDict() -> [Character: Int] {
        var dict = [Character: Int]()
        
        dict["I"] = 1
        dict["V"] = 5
        dict["X"] = 10
        dict["L"] = 50
        dict["C"] = 100
        dict["D"] = 500
        dict["M"] = 1000
        
        return dict
    }
}

func testRomanToInt() {
//    let x = LeetCode.romanToInt("III")
    let x = LeetCode.romanToIntSwift("IV")
//    let x = LeetCode.romanToInt("IX")
//    let x = LeetCode.romanToInt("LVIII")
//    let x = LeetCode.romanToInt("MCMXCIV")
    
    print(x)
}
