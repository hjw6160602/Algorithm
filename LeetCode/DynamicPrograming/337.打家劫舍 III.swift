//
//  337.打家劫舍 III.swift
//  DynamicPrograming
//
//  Created by 贺嘉炜 on 2023/3/1.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    44 ms 25%
//    14.4 MB 94.44%
    func rob(_ root: TreeNode?) -> Int {
        let res = dp(root)
        return max(res[0], res[1])
    }

    /* 返回一个大小为 2 的数组 arr
       arr[0] 表示不抢 root 的话，得到的最大钱数
       arr[1] 表示抢 root 的话，得到的最大钱数 */
    private func dp(_ root: TreeNode?) -> [Int] {
        guard let node = root else {
            return [0, 0]
        }
        let left = dp(node.left)
        let right = dp(node.right)
        // 抢, 下家就不能抢了
        let rob = node.val + left[0] + right[0]
        // 不抢，下家可抢可不抢，取决于收益大小
        let notRob = max(left[0], left[1]) + max(right[0], right[1])
         
        return [notRob, rob]
    }
}

class SolutionRob {
//    96 ms  13.89%
//    15.1 MB 19.44%
    var memo = [TreeNode: Int]()

    func rob(_ root: TreeNode?) -> Int {
        guard let node = root else {
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

class TreeNode {
    var val: Int = 0
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int) {
        self.val = val
    }
    
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
