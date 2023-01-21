//
//  148. 排序链表.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2022/8/22.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/sort-list

import Foundation


extension Solution {
    
    func sortListSwift(_ head: ListNode?) -> ListNode? {
            if (head == nil || head?.next == nil) {
                return head
            }
            var slow = head
            var fast = head?.next
            // 快慢指针法，使得slow指向链表的中间节点。
            while(fast != nil && fast?.next != nil){
                slow = slow?.next
                fast = fast?.next?.next
            }
            let last = slow?.next
            slow?.next = nil
            let first = sortList(head)
            let second = sortList(last)
            let res = MergeTwoList(first,second)
            return res;
        }

        func MergeTwoList(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
            let dummpy = ListNode(-1)
            var tail = dummpy
            var list1 = list1
            var list2 = list2
            while(list1 != nil && list2 != nil){
                if(list1?.val ?? 0 < list2?.val ?? 0){
                    tail.next = list1
                    list1 = list1?.next
                }else{
                    tail.next = list2
                    list2 = list2?.next
                }
                tail = tail.next!
            }
            tail.next = (list1 != nil ? list1 : list2);
            return dummpy.next
        }
    
    func sortList(_ head: ListNode?) -> ListNode? {
        let dummy = _quickSortList(head)
        return dummy?.next
    }
    
    private func _quickSortList(_ cur: ListNode?) -> ListNode? {
        guard let cur = cur else { return nil }
        
        let left = ListNode(), right = ListNode()
        var nxtLeft = left, nxtRight = right
        
        var node = cur.next
        while node != nil {
            if node!.val < cur.val {
                // 将 较小的节点放在左边
                nxtLeft.next = node
                nxtLeft = nxtLeft.next!
            } else {
                // 将 较大的节点放在左边
                nxtRight.next = node
                nxtRight = nxtRight.next!
            }
            node = node!.next
        }
        
        nxtLeft.next = nil
        nxtRight.next = nil
        LinkedList.display(left.next)
        LinkedList.display(right.next)
        
        if left.next != nil {
            left.next = _quickSortList(left.next)
        }
        if right.next != nil {
            right.next = _quickSortList(right.next)
        }
        nxtLeft.next = cur
        cur.next = right.next
        
        return left
        
    }
}

func test148sortList() {
    let list = LinkedList.createList([-1,5,3,4,0])
    let x = LeetCode.sortList(list)
    LinkedList.display(x)
}

//给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。

//示例 1：
//输入：head = [4,2,1,3]
//输出：[1,2,3,4]

//示例 2：
//输入：head = [-1,5,3,4,0]
//输出：[-1,0,3,4,5]

//示例 3：
//输入：head = []
//输出：[]

//提示：
//链表中节点的数目在范围 [0, 5 * 104] 内
//-105 <= Node.val <= 105

//进阶：你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？
