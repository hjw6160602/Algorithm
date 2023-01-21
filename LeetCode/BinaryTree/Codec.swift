//
//  Codec.swift
//  BinaryTree
//
//  Created by 贺嘉炜 on 2023/1/21.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

// 297. 二叉树的序列化与反序列化
// 广度优先搜索的方式去序列化
class Codec {
    //    84 ms 72.73%
    //    16.1 MB 33.33%
    static func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "[]"
        }
        
        var queue = [root]
        var res = "[\(root.val)"
        
        while !queue.isEmpty {
            // 当前这一层的节点个数
            let index = queue.count
            // 是否是最后一层
            var isLastLayer = true
            // 一层一层的去添加序列化字符串
            var layerStr = ""
            // 遍历其中一层
            for i in 0..<queue.count {
                
                let curNode: TreeNode = queue[i]
                
                if let left = curNode.left {
                    isLastLayer = false
                    queue.append(left)
                    layerStr.append(",\(left.val)")
                } else {
                    layerStr.append(",null")
                }
                if let right = curNode.right {
                    isLastLayer = false
                    queue.append(right)
                    layerStr.append(",\(right.val)")
                } else {
                    layerStr.append(",null")
                }
            }
            if !isLastLayer {
                res += layerStr
            }
            // 更新当前这层的队列
            queue = (index == queue.count) ? [] : [TreeNode](queue[index..<queue.count])
        }
        return res + "]"
    }
    
    static func deserialize(_ data: String) -> TreeNode? {
        var str = data
        // 去掉首位的两个括号[,]符号
        str.removeFirst()
        _ = str.popLast()
        // 将剩下的部分用 “,” 分割转化为数组
        let parts = str.split(separator: ",")
        var array:[String] = []
        for part in parts {
            var tempStr = String(part)
            // 去字符串当中的空格部分
            tempStr = tempStr.trimmingCharacters(in: .whitespaces)
            array.append(tempStr)
        }
        
        guard !array.isEmpty else {
            return nil
        }
        
        var rootIndex = 0
        var queue:[TreeNode] = []
        let value = Int(array[rootIndex])!
        let head = TreeNode(value)
        // 先将根节点放入队列
        queue.append(head)
        while true {
            var nextLayerQueue:[TreeNode] = []
            for node in queue {
                guard createNode(array, &rootIndex, isLeft: true, node, &nextLayerQueue) else {
                    return head
                }
                
                guard createNode(array, &rootIndex, isLeft: false, node, &nextLayerQueue) else {
                    return head
                }
            }
            // 将队列赋值为下一层
            queue = nextLayerQueue
        }
    }
    
    static func createNode(_ array:[String],
                            _ rootIndex: inout Int,
                            isLeft: Bool,
                            _ node: TreeNode,
                            _ nextLayerQueue: inout [TreeNode]) -> Bool {
        rootIndex += 1
        guard rootIndex < array.count else {
            return false
        }
        let item = array[rootIndex]
        if item == "null" {
            if isLeft {
                node.left = nil
            } else {
                node.right = nil
            }
        } else {
            let value = Int(item)
            let tempNode = TreeNode(value!)
            nextLayerQueue.append(tempNode)
            if isLeft {
                node.left = tempNode
            } else {
                node.right = tempNode
            }
        }
        return true
    }
}
