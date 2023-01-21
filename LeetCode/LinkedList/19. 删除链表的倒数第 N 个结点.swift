//
//  19. 删除链表的倒数第 N 个结点.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2022/7/18.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/remove-nth-node-from-end-of-list/

import Foundation


extension Solution {

//    0 ms 100.00%
//    13.5 MB 94.64%
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else { return nil }
        let dummy = ListNode()
        dummy.next = head
        
        var node: ListNode? = dummy, prevNthNode = dummy
        var cur = 0
        while node != nil {
            if cur > n {
                prevNthNode = prevNthNode.next!
            }
            node = node!.next
            cur += 1
        }
        // 删除倒数第N个节点
        prevNthNode.next = prevNthNode.next?.next
        
        return dummy.next
    }
}

func test19removeNthFromEnd() {
    let list = LinkedList.createList([1,2])
    let x = LeetCode.removeNthFromEnd(list, 1)
    LinkedList.display(x)
}

//给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
//
//示例 1：
//输入：head = [1,2,3,4,5], n = 2
//输出：[1,2,3,5]
//
//示例 2：
//输入：head = [1], n = 1
//输出：[]
//
//示例 3：
//输入：head = [1,2], n = 1
//输出：[1]
//
//提示：
//链表中结点的数目为 sz
//1 <= sz <= 30
//0 <= Node.val <= 100
//1 <= n <= sz
