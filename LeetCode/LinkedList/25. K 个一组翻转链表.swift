//
//  25. K 个一组翻转链表.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2022/12/5.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/reverse-nodes-in-k-group/

import Foundation

extension Solution {

//    24 ms 96.15%
//    14.7 MB 12.50%
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        let a = head
        var b: ListNode? = head
        for _ in 0..<k {
            if b == nil {
                // 不足 k 个，不需要反转，base case
                return head
            }
            b = b!.next
        }
        // 翻转的区间为：[a, b)
        let newHead = reverse(a, b)
        a.next = reverseKGroup(b, k)
        
        return newHead
    }
    
    func reverse(_ a: ListNode?, _ b: ListNode?) -> ListNode? {

        var pre: ListNode?
        var cur = a
        var nxt = a
        
        while cur !== b {
            nxt = cur?.next
            cur?.next = pre
            pre = cur
            cur = nxt
        }
        return pre
    }
}

func test25EqualNode() {
    let list = LinkedList.createList([1, 2, 3, 4, 5])
    LinkedList.display(list)
    let head = LeetCode.reverseKGroup(list, 1)
    LinkedList.display(head)
}


//给你链表的头节点 head ，每 k 个节点一组进行翻转，请你返回修改后的链表。
//
//k 是一个正整数，它的值小于或等于链表的长度。如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
//
//你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
