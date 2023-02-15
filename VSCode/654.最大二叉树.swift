/*
 * @lc app=leetcode.cn id=654 lang=swift
 *
 * [654] 最大二叉树
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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        let root = build(nums, 0, nums.count-1)
        return root
    }

    private func build(_ nums: [Int], _ l: Int, _ r: Int) -> TreeNode? {
        // base case
        if l > r {
            return nil
        }

        // 找到数组中的最大值和对应的索引
        var index = -1, maxVal = Int.min
        for i in l...r {
            if nums[i] > maxVal {
                maxVal = nums[i]
                index = i
            }
        }
        // 先构造出根节点
        let node = TreeNode(maxVal)
        // 递归调用构造左右子树
        node.left = build(nums, l, index-1)
        node.right = build(nums, index+1, r)
        return node
    }
}
// @lc code=end

