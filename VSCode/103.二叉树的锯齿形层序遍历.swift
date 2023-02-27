/*
 * @lc app=leetcode.cn id=103 lang=swift
 *
 * [103] 二叉树的锯齿形层序遍历
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        guard var node = root else {
            return res
        }

        var isLeftDirection = true
        var queue: [TreeNode] = [node]
        while !queue.isEmpty {
            // 每一层进来后都调转方向
            isLeftDirection = !isLeftDirection
            var path = [TreeNode]()
            for i in 0..<queue.count {
                let head = queue.removeFirst()
                if let left = head.left {
                    path.append(left)
                }
                if let right = head.right {
                    path.append(right)
                }
            }


            res.append(path)
        }
        return res
    }
}
// @lc code=end

