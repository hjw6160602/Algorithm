//
//  23. 合并K个升序链表.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2022/7/11.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/merge-k-sorted-lists

import Foundation

extension Solution {
    
//    68 ms 79.59%
//    15.9 MB 13.47%
//    133 / 133
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else {
            return nil
        }
        
        var left = 0
        var right = lists.count - 1
        
        var lists = lists
        
        while right > 0 {
            left = 0
            while left < right {
                lists[left] = _mergeTwoLists(l1: lists[left], l2: lists[right])
                left += 1
                right -= 1
            }
        }

        return lists[0]
    }
    
    private func _mergeTwoLists(l1: ListNode?, l2: ListNode?) -> ListNode? {
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

//    88 ms 51.24%
//    15.8 MB 15.29%
//    133 / 133
    // 二分合并不同链表
    func mergeKListsP1(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else {
            return nil
        }
        
        
        var left = 0, right = lists.count - 1
        var lists = lists
        
        while right > 0 {
            left = 0
            while left < right {
                lists[left] = _mergeTwoListsP1(l1: lists[left], l2: lists[right])
                right -= 1
                left += 1
            }
        }
        
        return lists[0]
    }
    
    // 从小到大合并两个有序链表
    private func _mergeTwoListsP1(l1: ListNode?, l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var node = dummy
        
        var l1 = l1, l2 = l2
        
        while l1 != nil && l2 != nil {
            if l1!.val > l2!.val {
                node.next = l2
                l2 = l2!.next
            } else {
                node.next = l1
                l1 = l1!.next
            }
            node = node.next!
        }
        node.next = l1 ?? l2
        
        return dummy.next
    }
}

func test23MergeKLists() {
    let list1 = LinkedList.createList([1,4,5])
    let list2 = LinkedList.createList([1,3,4])
    let list3 = LinkedList.createList([2,6])
    let lists = [list1, list2, list3]

    let merged = LeetCode.mergeKListsP1(lists)
    LinkedList.display(merged)
}

//给你一个链表数组，每个链表都已经按升序排列。
//请你将所有链表合并到一个升序链表中，返回合并后的链表。

//示例 1：
//输入：lists = [[1,4,5],[1,3,4],[2,6]]
//输出：[1,1,2,3,4,4,5,6]
//解释：链表数组如下：
//[
//  1->4->5,
//  1->3->4,
//  2->6
//]
//将它们合并到一个有序链表中得到。
//1->1->2->3->4->4->5->6

//示例 2：
//输入：lists = []
//输出：[]

//示例 3：
//输入：lists = [[]]
//输出：[]

//提示：
//k == lists.length
//0 <= k <= 10^4
//0 <= lists[i].length <= 500
//-10^4 <= lists[i][j] <= 10^4
//lists[i] 按 升序 排列
//lists[i].length 的总和不超过 10^4
