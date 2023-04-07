/*
 * @lc app=leetcode.cn id=82 lang=swift
 *
 * [82] 删除排序链表中的重复元素 II
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
    // 12 ms 100%
    // 13.8 MB 62%
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)

        var cur: ListNode? = dummy
        while cur?.next != nil && cur?.next?.next != nil {
            if cur?.next?.val == cur?.next?.next?.val {
                let x = cur?.next?.val
                while cur?.next != nil && cur?.next?.val == x {
                    cur?.next = cur?.next?.next
                } 
            } else {
                cur = cur?.next
            }
        }
        return dummy.next
    }
}
// @lc code=end

