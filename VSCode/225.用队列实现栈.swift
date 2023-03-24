/*
 * @lc app=leetcode.cn id=225 lang=swift
 *
 * [225] 用队列实现栈
 */

// @lc code=start

class MyStack {
    ///
    var queue = [Int]()
    var topElm = 0

    init() { }
    
    func push(_ x: Int) {
        queue.append(x)
        topElm = x
    }
    
    func pop() -> Int {
        var size = queue.count
        while size > 1 {
            queue.append(queue.removeFirst())
            size -= 1
        }
        return queue.removeFirst()
    }
    
    func top() -> Int {
        return topElm
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

