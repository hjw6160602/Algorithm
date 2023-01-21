//
//  67.二进制求和.swift
//  String
//
//  Created by 贺嘉炜 on 2022/4/16.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    8 ms 81.48%
//    13.9 MB 77.78%
//    294 / 294
    func addBinary(_ a: String, _ b: String) -> String {
        let x = [Character](a), y = [Character](b)
        let charZero = Character("0"), charOne = Character("1")
        var res = [Character]()
        
        var i = x.count - 1, j = y.count - 1
        var hasCarrier = false
        while i >= 0 || j >= 0 {
            var num = charOne
            var ai = false, bj = false
            if i >= 0 {
                ai = (x[i] == "1")
            }
            if j >= 0 {
                bj = (y[j] == "1")
            }
            
            if hasCarrier {
                if !ai && !bj {
                    hasCarrier = false
                } else if ai && bj {
                } else {
                    num = charZero
                }
            } else {
                if !ai && !bj {
                    num = charZero
                } else if ai && bj {
                    num = charZero
                    hasCarrier = true
                }
            }
            res.insert(num, at: 0)
            i -= 1
            j -= 1
        }
        if hasCarrier {
            res.insert(charOne, at: 0)
        }
                
        return String(res)
    }
    
//    8 ms 81.48%
//    13.9 MB 75.31%
    func addBinarySwift(_ a: String, _ b: String) -> String {
        let a = Array(a), b = Array(b)
        var res = "", carry = 0, i = a.count - 1, j = b.count - 1
        
        while i >= 0 || j >= 0 || carry > 0 {
            var sum = carry
            
            if i >= 0 {
                sum += Int(String(a[i]))!
                i -= 1
            }
            if j >= 0 {
                sum += Int(String(b[j]))!
                j -= 1
            }
            
            res = "\(sum % 2)" + res
            carry = sum / 2
        }
        
        return res
    }
}

func testAddBinary() {
    let x = LeetCode.addBinarySwift("1111", "1111")
//    let x = LeetCode.addBinary("1010", "1011")
//    let x = LeetCode.addBinarySwift("0", "0")
    print(x)
}
