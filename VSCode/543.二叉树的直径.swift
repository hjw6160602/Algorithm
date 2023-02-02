/*
 * @lc app=leetcode.cn id=543 lang=swift
 *
 * [543] 二叉树的直径
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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        let _ = maxDepth(root, &diameter)
        return diameter
    }

    private func maxDepth(_ root: TreeNode?, _ diameter: inout Int) -> Int {
        guard let node = root else {
            return  0
        }
        
        let leftDepth = maxDepth(node.left, &diameter)
        let rightDepth = maxDepth(node.right, &diameter)
        var curDiameter = leftDepth + rightDepth

        diameter = max(diameter, curDiameter)
        return max(leftDepth, rightDepth) + 1
    }

    // var diameter = 0

    // func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    //     let _ = maxDepth(root)
    //     return diameter
    // }

    // private func maxDepth(_ root: TreeNode?) -> Int {
    //     guard let node = root else {
    //         return  0
    //     }
        
    //     let leftDepth = maxDepth(node.left)
    //     let rightDepth = maxDepth(node.right)
    //     var curDiameter = leftDepth + rightDepth

    //     diameter = max(diameter, curDiameter)
    //     return max(leftDepth, rightDepth) + 1
    // }
}

// @lc code=end

