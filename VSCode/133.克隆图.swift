/*
 * @lc app=leetcode.cn id=133 lang=swift
 *
 * [133] 克隆图
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    var visited = [Node: Node]()

    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        // 如果该节点已经被访问过，则返回相应的复制节点
        if let copiedNode = visited[node] {
            return copiedNode
        }
        // 创建一个与原节点值相同的新节点
        let copiedNode = Node(node.val)
        // 存储原节点和被复制节点之间的映射
        visited[node] = copiedNode
        // 递归地复制节点的邻居
        copiedNode.neighbors = node.neighbors.map { cloneGraph($0) }
        // 返回复制的节点
        return copiedNode
    }
}

// @lc code=end

