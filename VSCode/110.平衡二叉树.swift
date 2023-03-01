/*
 * @lc app=leetcode.cn id=110 lang=swift
 *
 * [110] 平衡二叉树
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        var isBalance = true
        return deverse(root, &isBalance)
    }

    private func deverse(_ node: TreeNode?, isBalance: inout Bool) -> (Int, Bool) {
        guard isBalance else {
            return (0, false)
        }
        guard node != nil else {
            return (0, true)
        }
        guard node

        let (leftH, isBalanced) = deverse(node.left)
        let (rightH, isBalanced) = deverse(node.right)

        return (max(leftH, leftH) + 1, abs(leftH - rightH > 1))
    }
}
// @lc code=end

