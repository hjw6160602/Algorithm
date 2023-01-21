//  https://leetcode.com/problems/reverse-linked-list/
//  main.swift
//  206. Reverse Linked List
//
//  Created by saidicaprio on 2019/2/28.
//  Copyright © 2019 SaiDiCaprio. All rights reserved.
//

import Foundation

//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func createList(_ head: ListNode?) {
        if let head = head {
            var iterator = head
            for item in 1..<100 {
                let node = ListNode(item)
                iterator.next = node
                iterator = node
            }
        }
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var curNode = head!
        var prvNode: ListNode? = nil
        while curNode.next != nil {
            let nxtNode = curNode.next!
            curNode.next = prvNode
            prvNode = curNode
            curNode = nxtNode
        }
        curNode.next = prvNode
        return curNode
    }
    
    func display(_ head: ListNode?) {
        if let head = head {
            var node = head
            while node.next != nil {
                print("\(node.val)->", terminator: "")
                node = node.next!
            }
            print("\(node.val)->", terminator: "")
            print("NULL")
        }
    }
}

let head = ListNode(0)
let solution = Solution()
solution.createList(head)
solution.display(head)
let reversedHead = solution.reverseList(head)
solution.display(reversedHead)

