//
//  02. 两数相加.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/2/2.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
//  链接：https://leetcode-cn.com/problems/add-two-numbers


extension Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2

        let dummyHead = ListNode()
        var currentNode = dummyHead
        var hasCarrier = false

        while list1 != nil || list2 != nil {
            //  链表不一样长的情况下 值等于0
            let sum = (list1?.val ?? 0) + (list2?.val ?? 0) + (hasCarrier ? 1 : 0)
            hasCarrier = sum >= 10
            let value = hasCarrier ? sum % 10 : sum
            let node = ListNode(value)
            // 相加之后 移动 指针
            currentNode.next = node
            list1 = list1?.next
            list2 = list2?.next
            currentNode = node
        }
        // 处理最高位的进位
        if hasCarrier {
            let node = ListNode(1)
            currentNode.next = node
            currentNode = node
        }

        return dummyHead.next
    }
    
    
    
//    执行用时：40 ms 在所有 Swift 提交中击败了 80.32% 的用户
//    内存消耗：13.6 MB 在所有 Swift 提交中击败了 55.36% 的用户
//    通过测试用例：1568 / 1568
    func addTwoNumbersP1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }
        
        let dummy = ListNode()
        var node1 = l1
        var node2 = l2
        var hasCarry = false
        var current = dummy
        
        while node1 != nil || node2 != nil {
            let node = ListNode()
            var res: Int = hasCarry ? 1 : 0
            if node1 != nil {
                res += node1!.val
            }
            if node2 != nil {
                res += node2!.val
            }
            
            hasCarry = res >= 10
            if hasCarry {
                res = res % 10
            }
            node.val = res
            current.next = node
            current = node
            
            node1 = node1?.next
            node2 = node2?.next
        }
        if hasCarry {
            let node = ListNode(1)
            current.next = node
        }
        
        return dummy.next
    }
    
}
    
func testAddSum() {
    //    l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
    let l1 = LinkedList.createList([9,9,9,9,9,9,9])
    let l2 = LinkedList.createList([9,9,9,9])
//    let l1 = LinkedList.createList([2,4,3])
//    let l2 = LinkedList.createList([5,6,4])
    let sumList = LeetCode.addTwoNumbersP1(l1, l2)
    LinkedList.display(sumList)
}

//    给你两个 非空 的链表，表示两个非负的整数。
//    它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
//
//    请你将两个数相加，并以相同形式返回一个表示和的链表。
//
//    你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

//    输入：l1 = [2,4,3], l2 = [5,6,4]
//    输出：[7,0,8]
//    解释：342 + 465 = 807.
    
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        guard let l1 = l1 else { return l2 }
//        guard let l2 = l2 else { return l1 }
//
//        let outputNode = ListNode((l1.val + l2.val) % 10)
//        if l1.val + l2.val > 9 {
//            outputNode.next = addTwoNumbers(addTwoNumbers(l1.next, l2.next),
//                                            ListNode(1))
//        } else {
//            outputNode.next = addTwoNumbers(l1.next, l2.next)
//        }
//        return outputNode
//    }

