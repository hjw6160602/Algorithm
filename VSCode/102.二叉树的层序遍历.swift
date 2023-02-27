/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层序遍历
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

//  8 ms 95.38%
//  13.8 MB  97.69%
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        guard var node = root else {
            return res
        }
        
        var queue: [TreeNode] = [node]
        while !queue.isEmpty {
            var path = [Int]()
            for i in 0..<queue.count {
                let head = queue.removeFirst()
                path.append(head.val)
                if let left = head.left {
                    queue.append(left)
                }
                if let right = head.right {
                    queue.append(right)
                }
            }
            res.append(path)
        }
        return res
    }
}
// @lc code=end

