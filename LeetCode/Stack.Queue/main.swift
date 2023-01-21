//
//  main.swift
//  Stack.Queue
//
//  Created by SaiDiCaprio on 2021/2/4.
//  Copyright © 2021 saidicaprio. All rights reserved.
//


let LeetCode = Solution.shared

class Solution {
    static let shared = Solution()
    private init() {}
}

//testSlideWindow()
//testMinStack()
//testDailyTemperatures()
testIsValidBracket()
//testMaxSlidingWindow()
//testDailyTemperatures()
//test496NextGreaterElement()

private func testMinStack() {
    let minStack = MinStack()
    minStack.push(-2)
    minStack.push(0)
    minStack.push(-3)
    
    // 返回 -3.
    var minimum = minStack.getMin()
    print(minimum)
    minStack.pop()
    
    // 返回 0.
    let top = minStack.top()
    print(top)
    
    //返回 -2.
    minimum = minStack.getMin()
    print(minimum)
}

