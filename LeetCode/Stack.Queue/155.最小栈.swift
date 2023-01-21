//
//  155.最小栈.swift
//  Stack.Queue
//
//  Created by SaiDiCaprio on 2021/2/4.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
// 链接：https://leetcode-cn.com/problems/min-stack

import Foundation

// 一个支持 push pop top 操作 并能在常数时间内检索到最小元素的栈
class MinStack {
    /// 正常栈
    var stack: [Int] = []
    /// 最小栈
    var minStack: [Int] = []
    
    /** initialize your data structure here. */
    init() {

    }

    // 将元素 x 推入栈中
    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty {
            minStack.append(x)
        } else {
            let y = min(x, minStack.last!)
            minStack.append(y)
        }
    }

    // 删除栈顶的元素
    func pop() {
        _ = stack.popLast()
        _ = minStack.popLast()
    }

    // 获取栈顶元素
    func top() -> Int {
        return stack.last!
    }

    // 检索栈中的最小元素
    func getMin() -> Int {
        return minStack.last!
    }
}

//
//输入：
//["MinStack","push","push","push","getMin","pop","top","getMin"]
//[[],[-2],[0],[-3],[],[],[],[]]
//
//输出：
//[null,null,null,null,-3,null,0,-2]
//
//提示： 
//
//pop  top 和 getMin 操作总是在 非空栈 上调用
