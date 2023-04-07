/*
 * @lc app=leetcode.cn id=83 lang=swift
 *
 * [83] 删除排序链表中的重复元素
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {

    // 20 ms 79.20%
    // 13.8 MB 52%
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var dummy = ListNode(head)

        var slow = head, fast = head
        while fast != nil {
            while fast?.val == slow?.val {
                fast = fast?.next
            }
            slow?.next = fast
            slow = fast
        }
        slow?.next = nil

        return dummy.next
    }

    // 16 ms 96%
    // 13.9 MB 24.80%
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var dummy = ListNode()
        dummy.next = head

        var slow = head, fast = head

        while fast != nil {
            if slow!.val != fast!.val {
                slow!.next = fast
                slow = fast
            }
            fast = fast!.next
        }
        // 这个很重要 将链条断开
        slow?.next = nil
        return dummy.next
    }
}

// @lc code=end

