//
//  main.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2021/2/4.
//  Copyright © 2021 saidicaprio. All rights reserved.
//

import Foundation

let LeetCode = Solution.shared

class Solution {
    static let shared = Solution()
    private init() {}
}

//testlowesTCommonAncestor()
//testRecoverTree()
//testMaxDepth()
//testGenerateParenthesis()
//testIsSymmetric()
//testhasPathSum()
//test104MaxDepth()
//testDiameterOfBinaryTree()
//testConstructMaximumBinaryTree()

//testPathSum()

//test94InorderTraversal()

// MARK: - DFS
//test100IsSameTree()
//test617MergeTrees()
//test538ConvertBST()
//test543DiameterOfBinaryTree()
//test226InvertTree()
//test124MaxPathSum()
//test114Flatten()
//test208Trie()

// MARK: - BFS
test297Codec()
//test102levelOrder()
//test107LevelOrderBottom()


//MARK: - 二叉搜索树
//test783MinDiffInBST()
//test572rangeSumBST()
//test108SortedArrayToBST()

private func _BSF_DFS() {
    let tree = BinaryTree()
    let array = tree.initializeInput("[5, 1, 4, 2, 11, 3, 6]")
    //let array = tree.initializeInput("[2,1,3]")
    let root = tree.initWithArray(array)
    //tree.preorderTraversal(root: root)
    //tree.inorderTraversal(root: root)
    //tree.postorderTraversal(root: root)
    //tree.bfs(root: root)
    tree.dfs(root: root)
    //for node in tree.traversalResult {
    //    print(node.val)
    //}
}

private func ValidateBinarySearchTree() {
    //Given a binary tree, determine if it is a valid binary search tree (BST).
    //
    //Assume a BST is defined as follows:
    //
    //The left subtree of a node contains only nodes with keys less than the node's key.
    //The right subtree of a node contains only nodes with keys greater than the node's key.
    //Both the left and right subtrees must also be binary search trees.

    /**
     * input: [2,1,3]
     * [5, 1, 4, null, null, 3, 6]
     */

    let tree = BinaryTree()
    //let array = tree.initializeInput("[5, 1, 4, null, null, 3, 6]")
    let array = tree.initializeInput("[2,1,3]")
    let root = tree.initWithArray(array)
    print(LeetCode.isValidBST(root))
}



