/*
 * @lc app=leetcode.cn id=2331 lang=swift
 *
 * [2331] 计算布尔二叉树的值
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
    // 108 ms 5.77%
    // 13.9 MB 55.77
    func evaluateTree(_ root: TreeNode?) -> Bool {
        return deverse(root!) == 1
    }

    private func deverse(_ node: TreeNode) -> Int {
        guard node.left != nil && node.right != nil else {
            return node!.val
        }
        let x = deverse(node.left!)
        let y = deverse(node.right!)

        if (node.val == 3) {
            node.val = x && y
        } else if (node.val == 2) {
            node.val = x || y
        }
        return node.val
    }
}
// @lc code=end

