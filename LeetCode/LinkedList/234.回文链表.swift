//
//  234.回文链表.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/2/3.
//  Copyright © 2021 saidicaprio. All rights reserved.
//
//  https://leetcode-cn.com/problems/palindrome-linked-list
//

import Foundation

class TraverseSolution {
//    796 ms 16.97%
//    31 MB 41.82%
    // 后续遍历的方法 时间和空间复杂度都是 O(N)
    var left: ListNode?
    
    /// 是否是回文链表
    func isPalindrome(_ head: ListNode?) -> Bool {
        left = head
        return traverse(head)
    }
    
    private func traverse(_ right: ListNode?) -> Bool {
        if right == nil {
            return true
        }
        var res = traverse(right?.next)
        // 后续遍历代码
        res = res && (right?.val == left?.val)
        left = left?.next

        return res
    }
}

extension Solution {
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard let head = head,
              head.next != nil else {
            return true
        }
        
        if head.next?.next == nil {
            return (head.val == head.next?.val)
        }
        
        // 找到中间节点
        let mid = findMiddleNode(head: head)
        // 翻转右边部分
        var rHead = reverseList(mid?.next)
        var lHead: ListNode? = head
        
        while rHead != nil {
            guard lHead?.val == rHead?.val else {
                return false
            }
            lHead = lHead?.next
            rHead = rHead?.next
        }
        return false
    }
    
    // 找到中间节点
    private func findMiddleNode(head: ListNode?) -> ListNode? {
        let fast = head
        let slow = head
//        while fast.next != nil && fast.next?.next != nil {
//            slow = slow.next ?? nil
//            fast = fast.next?.next
//        }
        return slow
    }
    
    /**
     * 翻转链表
     * - parameter head: 原链表的头结点
     * 比如按原链表是 1->2->3->4->nil 翻转之后是 4->-3->2->1->nil
     * - return: 翻转之后的链表的头结点 (返回4)
     */
    private func reverseList(head: inout ListNode?) -> ListNode? {
        let rHead: ListNode? = nil
        while head?.next != nil {
            head = head?.next
            rHead?.next = head
            head = head?.next
        }
        return rHead
    }
    
    
//    执行用时：820 ms 在所有 Swift 提交中击败了 85.62% 的用户
//    内存消耗：26 MB 在所有 Swift 提交中击败了 74.66% 的用户
//    通过测试用例： 85 / 85
    func isPalindromeP1(_ head: ListNode?) -> Bool {
        // 空链表算回文列表
        guard let head = head else { return true }
        // 单独节点算回文链表
        guard let nxtNode = head.next else { return true }

        // 只有两个节点判断这俩的值是否相等
        guard nxtNode.next != nil else {  return head.val == nxtNode.val }
        
        // 能来到这里说明最少有3个节点
        let mid = findMiddle(head)
        var secondHead = reverseList2(mid.next)
        var node: ListNode? = head
        while secondHead != nil {
            guard node?.val == secondHead?.val else {
                return false
            }
            node = node?.next
            secondHead = secondHead?.next
        }
        
        return true
    }
    
    private func findMiddle(_ head: ListNode) -> ListNode {
        var fast = head, slow = head
        while fast.next != nil && fast.next!.next != nil {
            slow = slow.next!
            fast = fast.next!.next!
        }
        return slow
    }
    
    private func findMiddleOld(_ head: ListNode?) -> ListNode {
        var node = head
        var index = 0
        while node != nil {
            node = node?.next
            index += 1
        }
        var j = 0
        node = head
        while j < ((index - 1) >> 1) {
            node = node?.next
            j += 1
        }
        return node!
    }
    
    private func reverseList2(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        // 来到这里证明至少有 两个节点
        var current = head
        var revesedH: ListNode?
        while current != nil {
            (current!.next, revesedH, current ) = (revesedH, current, current!.next)
        }
        return revesedH
    }
    
}

func testIsPalindrome() {
    let list = LinkedList.createList( [1,2] )
    LinkedList.display(list)
//    let x = Solution.shared.isPalindromeP1(list)
    let x = TraverseSolution().isPalindrome(list)
    print(x)
}

//请判断一个链表是否为回文链表。
//示例 1:
//输入: 1->2
//输出: false

//示例 2:
//输入: 1->2->2->1
//输出: true
//进阶：

//你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？

