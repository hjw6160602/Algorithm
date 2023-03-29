/*
 * @lc app=leetcode.cn id=108 lang=swift
 *
 * [108] 将有序数组转换为二叉搜索树
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty {
            return nil
        }
        let n = nums.count / 2
        var root = TreeNode(nums[n])
        root.left = sortedArrayToBST(Array(nums[0..<n]))
        root.right = sortedArrayToBST(Array(nums[n+1..<nums.count]))
        return root
    }
}
// @lc code=end

