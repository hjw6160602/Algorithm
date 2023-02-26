/*
 * @lc app=leetcode.cn id=230 lang=swift
 *
 * [230] 二叉搜索树中第K小的元素
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
    var rank = 0
    var res = 0

    // 52 ms 84.9%
    // 14.8 MB 70.45%
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        traverse(root, k)
        return res
    }

    private func traverse(_ root: TreeNode?, _ k: Int) {
        guard var node = root else {
            return
        }
        traverse(node.left, k)
        /* 中序遍历代码位置 */
        rank += 1
        if rank == k {
            // 找到第 k 小的元素
            res = node.val;
            return
        }
        traverse(node.right, k)
    }
}
// @lc code=end

