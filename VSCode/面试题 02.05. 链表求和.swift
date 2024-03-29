/*
 * @lc app=leetcode.cn id=* lang=swift
 *
 * 面试题 02.05. 链表求和
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard var l1 = l1 else {
            return l2
        }
        guard var l2 = l2 else {
            return l1
        }
        
        var carrier = 0
        var head = ListNode(), cur: ListNode? = head

        while l1 != nil || l2 != nil {
            let val = l1?.val ?? 0 + l2?.val ?? 0 + carrier
            // 处理真正的加法值
            if val > 9 {
                val -= 10
                carrier = 1
            } else {
                carrier = 0
            }
            cur.val = val

            cur.next = ListNode()
            cur = cur.next!

            l1 = l1?.next
            l2 = l2?.next
        }

        if carrier > 0 {
            cur!.val = ListNode(val: 1)
        } else {
            cur = nil
        }

        return head
    }
}

