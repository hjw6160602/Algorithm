//
//  BinaryTree.swift
//  98. Validate Binary Search Tree
//
//  Created by saidicaprio on 2019/4/17.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

import Foundation

protocol Traversal {
    func preorderTraversal(_ root: TreeNode?)
    func inorderTraversal(_ root: TreeNode?)
    func postorderTraversal(_ root: TreeNode?)
    
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
//    0 ms 100%
//    13.8 MB 69.68
    func preorderTraversal(_ root: TreeNode?) {
        guard root != nil else { return }
         
        var node = root
        var stack = [TreeNode]()
        
        while true {
            if node != nil {
                // 访问 node 节点
                traversalResult.append(node!)
                // 将右子节点入栈
                if node!.right != nil {
                    stack.append(node!.right!)
                }
                // 一路向左
                node = node!.left
            } else if stack.isEmpty  {
                // 如果栈为空 证明所有的节点访问完毕 return
                return
            } else {
                // 处理右边 将右边的节点出栈 然后循环访问
                node = stack.popLast()
            }
        }
    }
    
//    0 ms 100%
//    13.8 MB 66.83%
    func inorderTraversal(_ root: TreeNode?) {
        guard root != nil else { return }
        
        var node = root
        var stack = [TreeNode]()
        
        while true {
            if node != nil {
                // 一路向左 将左边的节点入队
                stack.append(node!)
                node = node!.left
            } else if stack.isEmpty{
                return
            } else {
                // 如果没有左子树了 那么将这个节点给访问了
                node = stack.popLast()
                // 访问node节点
                traversalResult.append(node!)
                // 让右节点进行中序遍历
                node = node!.right
            }
        }
    }
    
    func postorderTraversal(_ root: TreeNode?) {
        guard root != nil else { return }
        
        var stack = [TreeNode]()
        stack.append(root!)
        // 记录上一次弹出访问的节点
        var prev = root
        
        while !stack.isEmpty {
            var top = stack.last!
            if (top.left == nil && top.right == nil) ||
                (top.left === prev || top.right === prev) {
                prev = stack.popLast()
                traversalResult.append(prev!)
            } else {
                // 栈顶右边入栈
                if let right = top.right {
                    stack.append(right)
                }
                // 栈顶左边入栈
                if let left = top.left {
                    stack.append(left)
                }
            }
        }
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
