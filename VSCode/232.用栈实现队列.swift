/*
 * @lc app=leetcode.cn id=232 lang=swift
 *
 * [232] 用栈实现队列
 */

// @lc code=start

class MyQueue {

    var stack1 = [Int]()
    var stack2 = [Int]()

    init() {}
    
    func push(_ x: Int) {
        self.stack1.append(x)
    }
    
    func pop() -> Int {
        // 先调用 peek 保证 s2 非空
        _ = peek()
        return stack2.removeLast()
    }
    
    func peek() -> Int {
        // 两个栈必定有一个不是空的
        if stack2.isEmpty {
            // 如果stack2为空 那么将stack1中的元素倒出来
            while !stack1.isEmpty {
                stack2.append(stack1.removeLast())
            } 
        }
        // 如果stack2不为空，那么直接返回栈顶元素
        return  stack2.last ?? 0
    }
    
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
// @lc code=end

