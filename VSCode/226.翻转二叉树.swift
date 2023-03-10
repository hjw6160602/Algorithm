/*
 * @lc app=leetcode.cn id=226 lang=swift
 *
 * [226] 翻转二叉树
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        traverse(root)
        return root
    }

    private func traverse(_ root: TreeNode?) {
        guard var node = root else {
            return
        }
        /**** 前序位置 ****/
        // 每一个节点需要做的事就是交换它的左右子节点
        (node.left, node.right) = (node.right, node.left)

        traverse(node.left)
        traverse(node.right)
    }
}
// @lc code=end

