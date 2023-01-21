//
//  21. 合并两个有序链表.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/3/8.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/merge-two-sorted-lists

import Foundation

extension Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var node = dummy
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                node.next = l1
                l1 = l1!.next
            } else {
                node.next = l2
                l2 = l2!.next
            }
            node = node.next!
        }
        node.next = l1 ?? l2
        return dummy.next
    }
    
    func mergeTwoListsSwift(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var node = dummy
        
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                node.next = l1
                l1 = l1!.next
            } else {
                node.next = l2
                l2 = l2!.next
            }
            node = node.next!
        }
        
        node.next = l1 ?? l2
        
        return dummy.next
    }
    
    /// 21.03.15
    func mergeTwoListsPractice1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }
        
        var l1 = l1, l2 = l2
        
        var curr = ListNode()
        let dummy = curr
        
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                curr.next = l1
                l1 = l1?.next
            } else {
                curr.next = l2
                l2 = l2?.next
            }
            curr = curr.next!
        }
        // 少了这一步 如果其中一个链表为空直接来到这里
        curr.next = l1 ?? l2
        return dummy.next
    }
}

func testMergeTwoLists() {
                                //  1,1,2,3,4,4
    let l1 = LinkedList.createList([1, 2, 4])
    LinkedList.display(l1)
    let l2 = LinkedList.createList([1, 3, 4])
    LinkedList.display(l2)
    
    let head = LeetCode.mergeTwoListsPractice1(l1, l2)
    LinkedList.display(head)
}


// 将两个升序链表合并为一个新的 升序 链表并返回。
// 新链表是通过拼接给定的两个链表的所有节点组成的。
 
// 示例 1：
// 输入：l1 = [1,2,4], l2 = [1,3,4]
// 输出：[1,1,2,3,4,4]
 
// 示例 2：
// 输入：l1 = [], l2 = []
// 输出：[]
 
// 示例 3：
// 输入：l1 = [], l2 = [0]
// 输出：[0]
 
// 提示：
// 两个链表的节点数目范围是 [0, 50]
// -100 <= Node.val <= 100
// l1 和 l2 均按 非递减顺序 排列

