/*
 * @lc app=leetcode.cn id=19 lang=swift
 *
 * [19] 删除链表的倒数第 N 个结点
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode()
        dummy.next = head

        var k: Int = 1
        var prevKthNode = dummy, node:ListNode? = head
        while node != nil {
            if  k > n {
                prevKthNode = prevKthNode.next! 
            }
            node = node!.next
            k += 1
        }

        prevKthNode.next = prevKthNode.next?.next
        return dummy.next
    }
}
// @lc code=end

