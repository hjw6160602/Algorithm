//
//  BinaryTree.swift
//  98. Validate Binary Search Tree
//
//  Created by saidicaprio on 2019/4/17.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

import Foundation

protocol Traversal {
    func preorderTraversal(root node: TreeNode?)
    func inorderTraversal(root node: TreeNode?)
    func postorderTraversal(root node: TreeNode?)
    
    func bfs(root: TreeNode?)
    func dfs(root: TreeNode?)
}

class BinaryTree {
    /// 头结点
    var head: TreeNode?
    /// 遍历结果
    var traversalResult: [TreeNode] = []
    /// 初始化需要的数组
    private var array: [String] = []
    
    func initializeInput(_ input: String) -> [String] {
        var str = input
        str.remove(at: str.startIndex)
        str.remove(at: str.index(before: str.endIndex))
        let parts = str.split(separator: ",")
        var array:[String] = []
        for part in parts {
            var tempStr = String(part)
            tempStr = tempStr.trimmingCharacters(in: .whitespaces)
            array.append(tempStr)
        }
        self.array = array
        //        print(array)
        return array
    }
    
    func initWithInput(_ input: String) -> TreeNode? {
        let array = self.initializeInput(input)
        return self.initWithArray(array)
    }
    
    func initWithArray(_ array: [String]) -> TreeNode? {
        if self.array.count == 0 {
            self.array = array
        }
        let count = array.count
        guard count > 0 else {
            return nil
        }
        
        var rootIndex = 0
        var queue:[TreeNode] = []
        let value = Int(array[rootIndex])!
        head = TreeNode(value)
        queue.append(head!)
        while true {
            var nextLayerQueue:[TreeNode] = []
            for node in queue {
                guard createNode(rootIndex: &rootIndex, isLeft: true, node: node, nextLayerQueue: &nextLayerQueue, count: count) else {
                    return head
                }

                guard createNode(rootIndex: &rootIndex, isLeft: false, node: node, nextLayerQueue: &nextLayerQueue, count: count) else {
                    return head
                }
            }
            queue = nextLayerQueue
        }
    }
    
    func createNode(rootIndex: inout Int, isLeft: Bool, node: TreeNode, nextLayerQueue: inout [TreeNode], count: Int) -> Bool {
        rootIndex += 1
        guard rootIndex < count else {
            return false
        }
        let item = self.array[rootIndex]
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
    
    func displayTraversalResult() -> [Int]{
        var vals = [Int]()
        for node in self.traversalResult {
            vals.append(node.val)
        }
        return vals
    }
}

extension BinaryTree: Traversal {
    func preorderTraversal(root node: TreeNode?) {
        guard node != nil else {
            return
        }
        self.traversalResult.append(node!)
        preorderTraversal(root: node!.left)
        preorderTraversal(root: node!.right)
//        if let node = node {
//            self.traversalResult.append(node)
//            preorderTraversal(root: node.left)
//            preorderTraversal(root: node.right)
//        }
    }
    
    func inorderTraversal(root node: TreeNode?) {
        guard node != nil else {
            return
        }
        inorderTraversal(root: node!.left)
        self.traversalResult.append(node!)
        inorderTraversal(root: node!.right)
    }
    
    func postorderTraversal(root node: TreeNode?) {
        guard node != nil else {
            return
        }
        postorderTraversal(root: node!.left)
        postorderTraversal(root: node!.right)
        self.traversalResult.append(node!)
    }
    
    func bfs(root: TreeNode?) {
        var queue = [TreeNode]()
        if let root = root {
            queue.append(root)
        }
        while !queue.isEmpty {
            let current = queue.removeFirst()
            visit(current)
            current.visited = true
            for node in current.neighbors {
                if !node.visited {
                    queue.append(node)
                }
            }
        }
    }
    
    func dfs(root node: TreeNode?) {
        guard let node = node else {
            return
        }
        visit(node)
        node.visited = true
        for node in node.neighbors {
            if !node.visited {
                dfs(root: node)
            }
        }
    }
    
    private func visit(_ node: TreeNode?) {
        guard node != nil else {
            return
        }
        print(node!.val)
    }
}
