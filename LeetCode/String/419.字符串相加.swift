//
//  419.字符串相加.swift
//  String
//
//  Created by SaiDiCaprio on 2021/3/16.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/add-strings

import Foundation

extension Solution {
    //给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和
    func addStrings(_ num1: String, _ num2: String) -> String {
        let x = [Character](num1.reversed())
        let y = [Character](num2.reversed())
        
        let count = max(x.count, y.count)
        var res = [Character](repeating: "0", count: count)
        
        var needCarrier = false
        var index = 0
        while index < count {
            var xNo: UInt8 = 0, yNo: UInt8 = 0
            if index < x.count {
                let xChar = x[index]
                xNo = xChar.asciiValue! - 48
            }
            if index < y.count {
                let yChar = y[index]
                yNo = yChar.asciiValue! - 48
            }
            var zNo = xNo + yNo
            if needCarrier {
                zNo += 1
            }
            if zNo > 9 {
                needCarrier = true
                zNo = zNo % 10
            } else {
                needCarrier = false
            }
            
            res[index] = Character(UnicodeScalar(zNo + 48))
            index += 1
        }
        
        if needCarrier {
            res.append("1")
        }
        let final = res.reversed()
        return String(final)
    }
    
    func addStrings2(_ num1: String, _ num2: String) -> String {
        var num1 = num1
        var num2 = num2
        var unit1 = 0   //num1的最后一位数
        var unit2 = 0   //num2的最后一位数
        var carry = 0  //unit1和unit2相加后的进位
        var ans = String()  //返回结果
        while !num1.isEmpty || !num2.isEmpty {
            if !num1.isEmpty {
                unit1 = Int(String(num1.removeLast())) ?? 0
            }
            if !num2.isEmpty {
                unit2 = Int(String(num2.removeLast())) ?? 0
            }
            
            let sum = unit1 + unit2 + carry    //unit1 和 unit2 的求和结果
            if sum > 9 {
                carry = 1  //两数相和大于10则进位+1，sum的个位返回结果
                ans.insert(contentsOf: String(sum - 10), at: ans.startIndex)
            } else {
                carry = 0  //两数相和如果小于10则进位归零，sum直接返回结果
                ans.insert(contentsOf: String(sum), at: ans.startIndex)
            }
            unit1 = 0   //每次计算完成后记得把两个unit归零（因为可能存在其中某个num已经empty了）
            unit2 = 0
        }
        if carry > 0 {
            ans.insert(contentsOf: "1", at: ans.startIndex)
        }
        return ans
    }
}

func testAddStrings() {
    
//      9 0
//    9 9 1
    let x = LeetCode.addStrings2("15315315", "4564528")
    print(x)
}

//提示：
//num1 和num2 的长度都小于 5100
//num1 和num2 都只包含数字 0-9
//num1 和num2 都不包含任何前导零
//你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式
