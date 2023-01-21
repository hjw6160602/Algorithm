//
//  160.交叉链表.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/2/3.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/intersection-of-two-linked-lists

import Foundation

extension Solution {
    // 找到两个单链表相交的起始节点
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil && headB != nil else { return nil }
        
        var nodeA = headA
        var nodeB = headB
        // 这里很好 !== 用来判断地址不相等 并且避免死循环 因为最后 是 nil = nil
        while nodeA !== nodeB {
            nodeA = nodeA == nil ? headB : nodeA?.next
            nodeB = nodeB == nil ? headA : nodeB?.next
        }
        return nodeA
    }
    
    func getIntersectionNodeSwift(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil { return nil }

        var pA = headA
        var pB = headB

        while pA !== pB {
            pA = pA == nil ? headB : pA?.next
            pB = pB == nil ? headA : pB?.next
        }
        return pA
    }
   
//    执行用时：260 ms 在所有 Swift 提交中击败了 58.01% 的用户
//    内存消耗：16.2 MB 在所有 Swift 提交中击败了 92.27% 的用户
//    通过测试用例： 39 / 39

    func getIntersectionNodeP1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil { return nil }
        
        var list1 = headA, list2 = headB
        
        var isl1Part2 = false, isl2Part2 = false
        while list1 !== list2 {
            if list1?.next == nil {
                if isl1Part2 { return nil }
                list1?.next = headB
                isl1Part2 = true
                // 在两条链表不相交的时候 为了避免死循环 把链表断开
                let lastNode = list1
                list1 = list1?.next
                lastNode?.next = nil
            }  else {
                list1 = list1?.next
            }
            
            
            if list2?.next == nil {
                if isl2Part2 { return nil }
                list2?.next = headA
                isl2Part2 = true
                // 在两条链表不相交的时候 为了避免死循环 把链表断开
                let lastNode = list2
                list2 = list2?.next
                lastNode?.next = nil
            } else {
                list2 = list2?.next
            }
        }
        return list1
    }
    
    func getIntersectionNodeP2(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil { return nil }

        var pA = headA
        var pB = headB

        while pA !== pB {
            if pA == nil {
                pA = headB
            } else {
                pA = pA?.next
            }
            
            if pB == nil {
                pB = headA
            } else {
                pB = pB?.next
            }
        }
        return pA
    }
    
    func getIntersectionNodeP3(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil { return nil }
        
        var list1 = headA, list2 = headB
        
        var isl1Part2 = false, isl2Part2 = false
        while list1 !== list2 {
            if list1?.next == nil {
                if isl1Part2 { return nil }
                list1 = headB
                isl1Part2 = true
            }  else {
                list1 = list1?.next
            }
            
            if list2?.next == nil {
                if isl2Part2 { return nil }
                list2 = headA
                isl2Part2 = true
            } else {
                list2 = list2?.next
            }
        }
        return list1
    }
    
}

//[4,1,8,4,5] [5, 0,1,8,4,5]
//[5,0,1,8,4, 5] [4,1,8,4,5]

func testGetIntersectionNode() {
    //[4,1,8,4,5, 5,0,1,8,4,5]
    //[5,0,1,8,4,5, 4,1,8,4,5]
    let list1 = LinkedList.createList([4,1,8,4,5])
    LinkedList.display(list1)
    let list2 = LinkedList.createList([5,0,1,8,4,5])
    LinkedList.display(list2)
    let head = LeetCode.getIntersectionNodeP3(list1, list2)
    print(head?.val ?? "")
}

// 示例 1：
// 输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
// 输出：Reference of the node with value = 8
// 输入解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）
// 从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,0,1,8,4,5]。
// 在 A 中，相交节点前有 2 个节点 在 B 中，相交节点前有 3 个节点

// 示例 2：
// 输入：intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
// 输出：Reference of the node with value = 2
// 输入解释：相交节点的值为 2 （注意，如果两个链表相交则不能为 0）
// 从各自的表头开始算起，链表 A 为 [0,9,1,2,4]，链表 B 为 [3,2,4]
// 在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点

// 示例 3：
// 输入：intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
// 输出：null
// 输入解释：从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。
// 由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值
// 解释：这两个链表不相交，因此返回 null

// 注意：
// 如果两个链表没有交点，返回 null.
// 在返回结果后，两个链表仍须保持原有的结构
// 可假定整个链表结构中没有循环
// 程序尽量满足 O(n) 时间复杂度，且仅用 O(1) 内存

