//
//  69.x的平方根.swift
//  Math
//
//  Created by 贺嘉炜 on 2022/3/30.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    24 ms 5.58%
//    13.6 MB 6.60%
//    1017 / 1017
    
    
    // let lineOfString = readLine(strippingNewline: true)!
//    4 ms 79.61%
//    13.4 MB  63.16%
    func mySqrtSwift(_ x: Int) -> Int {
        guard x >= 0 else { return 0 }

        var left = 0, right = x >> 1 + 1

        while left <= right {
            let mid = (right - left) >> 1 + left
            if mid * mid == x {
                return mid
            } else if mid * mid < x {
                left = mid + 1
            } else if mid * mid > x {
                right = mid - 1
            }
        }
        return right
    }
    
    func mySqrt(_ x: Int) -> Int {
        guard x != 0 else { return 0 }
        let half = (x >> 1) + 1
        for i in 1...half {
            let square = i * i
            if square < x {
                continue
            } else if square > x {
                return i - 1
            } else {
                return i
            }
        }
        return 0
    }
    // 超时
    func mySqrtP1(_ x: Int) -> Int {
        guard x != 0 else { return 0 }
        let half = (x >> 1) + 1
        for i in (1...half).reversed() {
            let square = i * i
            if square <= x {
                return i
            } else if square > x {
                continue
            }
        }
        return 0
    }
    
    // 超时
    func mySqrtSwiftP2(_ x: Int) -> Int {
        guard x >= 0 else { return 0 }
        
        var left = 0, right = x / 2 + 1
        
        while left <= right {
            let mid = (right - left) / 2 + left
            
            if mid * mid == x {
                return mid
            } else if mid * mid < x {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return right
    }
    
}

func testMySqrt() {
    for i in 0..<10 {
        print("\(i)的平方根：\( LeetCode.mySqrt(i))")
    }
//    print(res)
}
