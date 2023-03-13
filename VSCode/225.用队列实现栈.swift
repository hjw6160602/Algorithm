/*
 * @lc app=leetcode.cn id=225 lang=swift
 *
 * [225] 用队列实现栈
 */

// @lc code=start

class MyStack {
    ///
    var queue = [Int]()

    init() { }
    
    func push(_ x: Int) {
        queue.append(x)
    }
    
    func pop() -> Int {
        return queue.removeLast()
    }
    
    func top() -> Int {
        return queue.last ?? 0
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
// @lc code=end

