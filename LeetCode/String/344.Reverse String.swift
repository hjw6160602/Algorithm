//
//  344.Reverse String.swift
//  String
//
//  Created by 江雪 on 2021/2/18.
//  Copyright © 2021 saidicaprio. All rights reserved.
//

extension Solution {
    func reverseString(_ s: inout [Character]) {
        guard s.count > 1 else {
            return
        }
        let max = Int(s.count / 2)
        for index in 0..<max {
            (s[index], s[s.count - 1 - index]) =  (s[s.count - 1 - index], s[index])
        }
    }
    
//    func reverseString(_ s: inout [Character]) {
//        guard s.count > 1 else {
//            return
//        }
//        let max = Int(s.count / 2)
//        for index in 0..<max {
//            let temp = s[index]
//            s[index] = s[s.count - 1 - index]
//            s[s.count - 1 - index] = temp
//        }
//    }
    
    func reverseString2(_ s: inout [Character]) {
//        s.reverse()
        guard s.count > 0 else {
            return
        }
        var queue = [Character]()
        for _ in 1...s.count {
            queue.append(s.removeLast())
        }
        s = queue
    }
}

func testReversingString() {
    var characters:[Character] = ["h", "e", "l", "l"]
    LeetCode.reverseString(&characters)
    print(characters)
}
