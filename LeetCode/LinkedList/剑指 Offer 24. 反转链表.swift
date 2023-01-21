//
//  剑指 Offer 24. 反转链表.swift
//  LinkedList
//
//  Created by 贺嘉炜 on 2022/7/23.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/fan-zhuan-lian-biao-lcof

import Foundation

extension Solution {

//    8 ms 98.04%
//    14.4 MB 90.20%
    func reverseListO1(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var node: ListNode = head, preNode: ListNode? = nil
        while node.next != nil {
            let nxtNode = node.next!
            node.next = preNode
            preNode = node
            node = nxtNode
        }
        node.next = preNode
        return node
    }
    

//    12 ms 82.35%
//    14.1 MB 100.00%
    func reverseListO2(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }

        var node: ListNode? = head, preNode: ListNode? = nil
        while node != nil {
            let nxtNode = node!.next
            node!.next = preNode
            preNode = node
            node = nxtNode
        }
        return preNode
    }
}


func testOffer24ReverseList() {
    let list = LinkedList.createList([1, 2, 3, 4, 5])
    LinkedList.display(list)
    let head = LeetCode.reverseListO1(list)
    LinkedList.display(head)
}

//定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。
//
//示例:
//输入: 1->2->3->4->5->NULL
//输出: 5->4->3->2->1->NULL
//
//限制：
//0 <= 节点个数 <= 5000
