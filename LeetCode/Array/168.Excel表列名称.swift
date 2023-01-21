//
//  168.Excel表列名称.swift
//  Array
//
//  Created by 贺嘉炜 on 2021/2/26.
//  Copyright © 2021 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
    func convertToTitle(_ n: Int) -> String {
        var res = ""
        var n = n
        while n != 0 {
            let k = (n - 1) % 26
            res.append(Character(UnicodeScalar(65 + k)!))
            n = (n - 1)  / 26
        }
        return String(res.reversed())
    }
    
    
    /// 无敌解法
    func convertToTitle2(_ n: Int) -> String {
        var title : [Character] = []
        var lastIndex = 0
        for idx in 1...n {
            var x = idx % 26
            if x == 0 {
                x = 26
            }
//            let char: Character = ""
            let asciiValue = 64 + x
            let newChar = Character(UnicodeScalar(asciiValue)!)
            
            if newChar == "A" { // 需要进位
                
                if title.count == 0 {
                    title.append(newChar)
                    continue
                }
                // 用来标记 是否 需要添加新的元素
                var needAppendChar = true
                for j in 0..<title.count {
                    // 只有前面的字符全部都是Z才需要添加字符
                    guard title[j] == "Z" else {
                        needAppendChar = false
                        break
                    }
                }
                // 需要添加新的元素
                if needAppendChar {
                    for k in 0..<title.count {
                        title[k] = "A"
                    }
                    title.append("A")
                    lastIndex += 1
//                    print(title)
                    continue
                } else { // 不需要添加新的元素
                    var j = lastIndex
                    // 那么将当前字符的ASSIC + 1
                    let c = Character(UnicodeScalar(title[j].asciiValue! + 1))
                    title[j] = c
                    // 把前面的需要进位的数字全部替换掉
                    while title[j] > "Z" {
                        title[j] = "A"
                        j -= 1
                        guard j >= 0 else {
                            break
                        }
                        let c = Character(UnicodeScalar(title[j].asciiValue! + 1))
                        title[j] = c
                    }
                }
            } else {
                // 不需要进位直接将最后一位替换掉
                title[lastIndex] = newChar
            }
//            print(title)
        }
        return String(title)
    }
    
    
    func convertToTitle3(_ n: Int) -> String {
        var chars: [Character] = []
        
        var x = n
        
        while x != 0 {
            let k = (x - 1) % 26
            chars.append(Character(UnicodeScalar(65 + k)!))
            x = (x - 1) / 26
        }
        
        return String(chars.reversed())
    }
}

func testConvertToTitle() {
//    let x = LeetCode.convertToTitle3(701)
    let x = LeetCode.convertToTitle3(65)
    print(x)
}

//
//extension Character {
//    var isAscii: Bool {
//        return unicodeScalars.allSatisfy { $0.isASCII }
//    }
//    var ascii: UInt32? {
//        return isAscii ? unicodeScalars.first?.value : nil
//    }
//}
//
//extension StringProtocol {
//    var asciiValues: [UInt8] {
//        compactMap(\.asciiValue)
//    }
//
//    var asciiValue: UInt32 {
//        return compactMap { $0.ascii }
//    }
//
//}
