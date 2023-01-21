//
//  297.二叉树的序列化与反序列化.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2023/1/21.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
//    84 ms 72.73%
//    16.1 MB 33.33%
    // 广度优先搜索的方式去序列化
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "[]"
        }
        
        return ""
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        return nil
    }
}

func test297Codec() {
    let root = LeetCode.deserialize("[1,2,3,null,null,4,5]")
    let x = LeetCode.serialize(root)
    print(x)
//    let root = BinaryTree.initWithInput("[3,2,3,null,3,null,1]")
//    let x = LeetCode.rob(root)
//    print(x)
}
