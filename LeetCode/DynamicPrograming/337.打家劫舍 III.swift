//
//  337.打家劫舍 III.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2023/3/1.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode: Hashable {
    static public func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(left)
        hasher.combine(right)
    }
}

class SolutionRob {
//    96 ms  13.89%
//    15.1 MB 19.44%
    var memo = [TreeNode: Int]()

    func rob(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        if let res = memo[node] {
            return res
        }
        
        var robLeftsChild = 0, robRightsChild = 0
        // 抢
        if let leftNode = node.left {
            robLeftsChild = rob(leftNode.left) + rob(leftNode.right)
        }
        
        if let rightNode = node.right {
            robRightsChild = rob(rightNode.left) + rob(rightNode.right)
        }
        // 抢则需要将node.val加上去
        let robIt = node.val + robLeftsChild + robRightsChild
        // 不抢则不用将 node.val 加上去
        let notRob = rob(node.left) + rob(node.right)

        let res = max(robIt, notRob)
        // 利用memo备忘录消除重叠子问题 需要对TreeNode进行Hash映射
        memo[node] = res;
        return res
    }
}
