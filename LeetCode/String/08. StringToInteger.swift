//
//  08. StringToInteger.swift
//  String
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//


//        let nums: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
//        var item = 0
//            var isLegal = false
//            for (index, value) in nums.enumerated() {
//                if char == value {
//                    item = index
//                    isLegal = true
//                    break
//                }
//            }
//            guard isLegal else {
//                return 0
//            }

// 非法输入
// 0..9之外的非法输入
// 全局变量标记'0'和''两种情况
// '+', '-' 号的判断
// '+', '-' 一堆付好连写的时候的处理
// 是否越界

extension Solution {
    func myAtoi(_ str: String) -> Int {
        var sum = 0
        var flag = 1
        var index = 0
        
        // 1.先去字符串首部的空格
        var strCopy = [Character](str)
        while index < strCopy.count {
            guard strCopy[index] == " " else {
                break
            }
            index += 1
        }
        
        guard index < strCopy.count else {
            return sum
        }
        
        // 2. 判断第一个字符是不是正"+"负"-"符号，如果是则去掉正负号标记flag
        if strCopy.first == "-" {
            strCopy.remove(at: strCopy.startIndex)
            flag = -1
        } else if strCopy.first == "+" {
            strCopy.remove(at: strCopy.startIndex)
        }
        
        for char in strCopy {
            //3. 逐个字符串遍历，如果是合法字符再进入计算
            guard char >= "0" && char <= "9" else {
                return flag * sum
            }
            
            // 4. ASSIC码转为数字
            let value = Int(char.unicodeScalars.first!.value) - 48
            
            // 5. 累加算出总和
            sum = sum * 10 + value
            
            // 6. 越界判断
            if flag * sum > Int32.max {
                return Int(Int32.max)
            }
            
            if flag * sum < Int32.min {
                return Int(Int32.min)
            }
        }
        return flag * sum
    }
    
    func myAtoiSwift(_ str: String) -> Int {
        var res = 0
        var flag = 1
        var index = 0
        
        // trim
        let content = [Character](str)
        while index < content.count {
            guard content[index] == " " else {
                break
            }
            index += 1
        }
        
        guard index < content.count else {
            return res
        }
        
        // handle flag
        if content[index] == "-" {
            flag = -1
            index += 1
        } else if content[index] == "+" {
            index += 1
        }
        
        while index < content.count {
            guard _isDigit(char: content[index]) else {
                break
            }
            
            res = res * 10 + Int(String(content[index]))!
        
            if res >= Int32.max {
                if flag == 1 {
                    return Int(Int32.max)
                } else if flag == -1 {
                    return Int(Int32.min)
                }
            }
            index += 1
        }
        return flag * res
    }
    
    private func _isDigit(char: Character) -> Bool {
        return char >= "0" && char <= "9"
    }
}

//Character扩展代码
extension Character {
    func toInt() -> Int {
        var intFromCharacter:Int = 0
        for scalar in String(self).unicodeScalars {
            intFromCharacter = Int(scalar.value)
        }
        return intFromCharacter
    }
}

func testMyAtoi() {
    print(LeetCode.myAtoiSwift("   -42"))
    print(LeetCode.myAtoiSwift("   2147483648 white space"))
    print(LeetCode.myAtoiSwift("4193 with words"))
    print(LeetCode.myAtoiSwift("words and 987"))
    print(LeetCode.myAtoiSwift("3.14159"))
    print(LeetCode.myAtoiSwift("-+1"))
}
