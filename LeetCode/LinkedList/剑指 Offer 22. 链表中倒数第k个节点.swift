//
//  剑指 Offer 22. 链表中倒数第k个节点.swift
//  LinkedList
//
//  Created by 贺嘉炜 on 2022/7/29.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof

import Foundation

extension Solution {
//    4 ms 89.09%
//    13.5 MB 90.00%
//    208 / 208
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var node = head, n = 1
        while n < k {
            node = node?.next
            // 如果越界直接返回nil
            guard node != nil else { return nil }
            n += 1
        }
        // 这里能保证一定有值
        var res: ListNode = head!
        while node!.next != nil {
            node = node!.next
            res = res.next!
        }
        return res
    }
}

func test22GetKthFromEnd() {
    let list = LinkedList.createList([])
    LinkedList.display(list)
    let x = LeetCode.getKthFromEnd(list, 2)
    LinkedList.display(x)
}

//输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。
//例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。

//示例：
//给定一个链表: 1->2->3->4->5, 和 k = 2.
//返回链表 4->5.
