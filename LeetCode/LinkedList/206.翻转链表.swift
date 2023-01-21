//
//  206.翻转链表.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/2/4.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/reverse-linked-list

import Foundation

extension Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var rHead: ListNode? = nil
        var current = head
        while current != nil {
            (current!.next, rHead, current) = (rHead, current, current?.next)
        }
        return rHead
    }
    
    func reverseListP1(_ head: ListNode?) -> ListNode? {
        var rHead: ListNode? = nil
        var curNode = head
        while curNode != nil {
            let nxtNode = curNode!.next
            curNode!.next = rHead
            rHead = curNode
            curNode = nxtNode
        }
        return rHead
    }
    
    func reverseListP2(_ head: ListNode?) -> ListNode? {
        var rHead: ListNode? = nil
        var current = head
        while current != nil {
            (current!.next, rHead, current) = (rHead, current, current!.next)
        }
        return rHead
    }
    
//    执行用时：12 ms 在所有 Swift 提交中击败了 89.29% 的用户
//    内存消耗：14.5 MB 在所有 Swift 提交中击败了 23.66% 的用户
//    通过测试用例：28 / 28
    func reverseListP3(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        // 来到这里证明至少有 两个节点
        var current = head
        var revesedH: ListNode?
        while current != nil {
//            next = current!.next
//            current!.next = revesedH
//            revesedH = current
//            current = next
            (current!.next, revesedH, current ) = (revesedH, current, current!.next)
        }
        return revesedH
    }
}

func testReverseList() {
    let list = LinkedList.createList([1, 3, 8, 7, 9])
    LinkedList.display(list)
    let head = LeetCode.reverseListP3(list)
    LinkedList.display(head)
    //LinkedList.display(list)
}

//反转一个单链表。

//示例:
//输入: 1->2->3->4->5->NULL
//输出: 5->4->3->2->1->NULL

//进阶:
//你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

