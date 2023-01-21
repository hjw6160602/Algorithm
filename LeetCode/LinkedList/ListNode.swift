//
//  ListNode.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/2/2.
//  Copyright © 2021 saidicaprio. All rights reserved.
//

class ListNode {
//    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
//        return lhs.val == rhs.val &&
//            lhs.next == rhs.next
//    }
    
    ///
    var val: Int
    ///
    var next: ListNode?
    
     init() {
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

struct LinkedList {
    /// 通过数组 创建一个链表
    static func createList(_ list: [Int]) -> ListNode? {
        guard list.count > 0 else {
            return nil
        }
        let header = ListNode()
        var interator = header
        for value in list {
            let node = ListNode(value)
            interator.next = node
            interator = node
        }
        return header.next
    }
    
    static func display(_ head: ListNode?) {
        guard let head = head else {
            print("nil")
            return
        }
        var node = head
        while node.next != nil {
            print("\(node.val)->", terminator: "")
            node = node.next!
        }
        print("\(node.val)->", terminator: "")
        print("nil")
    }
    
    static func reverse(_ head: inout ListNode?) {
        var rHead: ListNode? = nil
        while head != nil {
//            let nextNode = head?.next
//            head?.next = rHead
//            rHead = head
//            head = nextNode
//            (2 0 1) = (0 1 2)
            (head!.next, rHead, head) = (rHead, head, head?.next)
        }
        head = rHead
    }

    static func reverseList(_ head: ListNode?) -> ListNode? {
        var rHead: ListNode? = nil
        var current = head
        while current != nil {
            (current!.next, rHead, current) = (rHead, current, current?.next)
        }
        return rHead
    }
}


