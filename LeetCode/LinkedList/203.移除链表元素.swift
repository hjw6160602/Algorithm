//
//  203.移除链表元素.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/2/3.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
//  https://leetcode-cn.com/problems/remove-linked-list-elements/


//删除链表中等于给定值 val 的所有节点。
extension Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode()
        dummy.next = head
        var node = dummy
        while node.next != nil {
            let nxtNode = node.next!
            if nxtNode.val == val {
                node.next = nxtNode.next
            } else {
                node = node.next!
            }
        }
        return dummy.next
    }
    
    
//    执行用时：44 ms 在所有 Swift 提交中击败了 98.31% 的用户
//    内存消耗：15.3 MB 在所有 Swift 提交中击败了 73.60% 的用户
//    通过测试用例：66 / 66
    func removeElementsMJ(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode()
        var node = head
        var last = dummy
        while node != nil {
            if node!.val != val {
                // 只有在值不相等的情况下 才去更新last节点
                last.next = node
                last = node!
            }
            // 遇到相等的直接跳过
            node = node!.next
        }
        // 确保最后一个节点是删干净的
        last.next = nil
        return dummy.next
    }
    
    func removeElementsP1(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode()
        var node = head
        var last = dummy
        while node != nil {
            if node!.val != val {
                // 不相等的时候把线连过来
                last.next = node
                last = node!
            }
            node = node!.next
        }
        last.next = nil
        return dummy.next
    }
    
    func removeElementsP2(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode()
        dummy.next = head
        var node = dummy
        while node.next != nil {
            let nxtNode = node.next!
            if node.next!.val == val {
                node.next = nxtNode.next
            } else {
                node = node.next!
            }
        }
        return dummy.next
    }
    
//    44 ms 87.24%
//    15.8 MB 7.14%
//    66 / 66

    func removeElementsP3(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else { return nil }
        let dummy = ListNode()
        dummy.next = head
        var node = dummy
        
        while node.next != nil {
            if node.next!.val == val {
                node.next = node.next?.next
                continue
            }
            guard let nxtNode = node.next else { break }
            node = nxtNode
        }
        return dummy.next
    }
    
    
}

func testRemoveElements() {
//    let list1 = LinkedList.createList([7,7,7,7])
    let list1 = LinkedList.createList([1,2,6,3,4,5,6])
    LinkedList.display(list1)
    let list2 = Solution.shared.removeElementsP3(list1, 6)
    LinkedList.display(list2)
}

//给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。
//
//
//示例 1：
//输入：head = [1,2,6,3,4,5,6], val = 6
//输出：[1,2,3,4,5]
//示例 2：
//
//输入：head = [], val = 1
//输出：[]
//示例 3：
//
//输入：head = [7,7,7,7], val = 7
//输出：[]
