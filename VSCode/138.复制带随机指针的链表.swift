/*
 * @lc app=leetcode.cn id=138 lang=swift
 *
 * [138] 复制带随机指针的链表
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {

    func copyRandomList(_ head: Node?) -> Node? {
        var originToClone = [Node: Node]()
        // 首先遍历，克隆所有节点
        var p = head
        while p != nil {
            if originToClone[p!] == nil {
                originToClone[p!] = Node(p!.val)
            }
            p = p!.next
        }

        // 第二次遍历，连接克隆节点的结构
        p = head
        while p != nil {
            if let next = p!.next {
                // 拿到复制后节点，修改其next指针
                originToClone[p!]?.next = originToClone[next]
            }
            if let random = p!.random {
                // 拿到复制后的节点，修改其random指针
                originToClone[p!]?.random = originToClone[random]
            }
            // 将原链表中的节点往下走
            p = p!.next
        }
    }

// Return the cloned head node
return originToClone[head]
    }
    var visited = [Node: Node]()

    // 递归拷贝链表 DFS
    func copyRandomList(_ head: Node?) -> Node? {
        guard let node = head else {
            return nil
        }
        // 如果节点已经被访问过了, 返回相应的拷贝节点
        if let copiedNode = visited[node] {
            return copiedNode
        }
        // 创建一个与原节点值相同的新节点
        let copiedNode = Node(node.val)
        // 存储原始节点和复制节点之间的映射
        visited[node] = copiedNode
        // 递归拷贝链表
        copiedNode.next = copyRandomList(node.next)
        copiedNode.random = copyRandomList(node.random)
        // 返回拷贝后的节点
        return copiedNode
    }
}
// @lc code=end

