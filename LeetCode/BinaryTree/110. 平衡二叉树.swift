//
//  110. 平衡二叉树.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2023/3/1.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func test110isisBalanced() {
    let root = BinaryTree().initWithInput("[1,null,2,null,3]")
    
    let x = SolutionBlanced().isBalanced(root)
    print(x)
}

class SolutionBlanced {
    var isBalance = true
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        _ = deverse(root)
        return isBalance
    }

    private func deverse(_ node: TreeNode?) -> Int {
        guard isBalance else {
            return 0
        }
        guard node != nil else {
            return 0
        }

        let leftH = deverse(node!.left) + 1
        let rightH = deverse(node!.right) + 1
        isBalance = abs(leftH - rightH) <= 1

        return max(leftH, rightH)
    }
}
