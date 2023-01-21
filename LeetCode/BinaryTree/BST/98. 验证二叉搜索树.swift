//
//  98. 验证二叉搜索树.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/2/4.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
// https://leetcode.com/problems/validate-binary-search-tree/

import Foundation

extension Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return _helper(root, nil, nil)
    }
    
    private func _helper(_ node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let node = node else {
            return true
        }
        
        if let min = min, node.val <= min {
            return false
        }
        
        if let max = max, node.val >= max {
            return false
        }
        
        return _helper(node.left, min, node.val) && _helper(node.right, node.val, max)
    }
}

