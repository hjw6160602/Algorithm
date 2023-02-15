/*
 * @lc app=leetcode.cn id=116 lang=swift
 *
 * [116] 填充每个节点的下一个右侧节点指针
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    // 59/59
    // 37.5% 76 ms
    // 42.86%  (14.7 MB)
    func connect(_ root: Node?) -> Node? {
        // 遍历「三叉树」，连接相邻节点
        traverse(root?.left, root?.right)
        return root
    }

    private func traverse(_ node1: Node?, _ node2: Node?) {
        guard var leftNode = node1, 
              var rightNode = node2 else {
            return
        }
        /**** 前序位置 ****/
        // 将传入的两个节点穿起来
        leftNode.next = rightNode

        // 连接相同父节点的两个子节点
        traverse(leftNode.left, leftNode.right)
        traverse(rightNode.left, rightNode.right)
        // 连接跨越父节点的两个子节点
        traverse(leftNode.right, rightNode.left)
    }
}
// @lc code=end

