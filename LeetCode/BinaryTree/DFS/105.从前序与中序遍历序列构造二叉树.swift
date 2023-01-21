//
//  105.从前序与中序遍历序列构造二叉树.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2022/7/14.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    20 ms 68.97%
//    14.1 MB 99.31%
//    203 / 203
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count == inorder.count else {
            return nil
        }
        
        return _buildHelper(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }
    
    private func _buildHelper(_ preorder: [Int], _ preStart: Int, _ preEnd: Int, _ inorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        guard preStart <= preEnd && inStart <= inEnd else {
            return nil
        }
        // 在inorder中找到 对应的rootIndex
        guard let rootIndex = inorder.firstIndex(of: preorder[preStart]) else {
            return nil
        }
        let root = TreeNode(preorder[preStart])
        // 对于找到的inorder总的rootIndex来说 其左子树所在范围长度：Range = rootIndex - inStart
        
        // 寻找左子树：左子树在preorder中一定会在 preStart之后的节点
        // 也就是说 preStart = preStart + 1，preEnd = preStart + Range
        // 而对于inorder而言 左子树一定出现在 rootIndex之前 也就是说 inEnd = rootIndex - 1
        root.left = _buildHelper(preorder, preStart + 1, preStart + rootIndex - inStart, inorder, inStart, rootIndex - 1)
        //
        // 寻找右子树：右子树在preorder中 preStart = preStart + Range + 1, preEnd不动
        // inorder中 只需要将 inStart = rootIndex + 1 即可
        root.right = _buildHelper(preorder, preStart + rootIndex - inStart + 1, preEnd, inorder, rootIndex + 1, inEnd)
//          preOrder                                 inOrder
//        (preStart + 1)...(preStart + Range)    inStart ... (rootIndex - 1)
//        (preStart + Range + 1) ... preEnd     (rootIndex + 1) ... inEnd
        
        return root
    }
    
    
}

func test105BuildTree() {
    let preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
    let x = LeetCode.buildTree(preorder, inorder)
    print(x!.val)
}

//示例 1:
//输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
//输出: [3,9,20,null,null,15,7]

//示例 2:
//输入: preorder = [-1], inorder = [-1]
//输出: [-1]


//提示:
//1 <= preorder.length <= 3000
//inorder.length == preorder.length
//-3000 <= preorder[i], inorder[i] <= 3000
//preorder 和 inorder 均 无重复 元素
//inorder 均出现在 preorder
//preorder 保证 为二叉树的前序遍历序列
//inorder 保证 为二叉树的中序遍历序列
