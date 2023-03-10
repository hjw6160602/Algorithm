/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var l1 = list1, l2 = list2, node = dummy
        while l1 !== nil && l2 !== nil {
            if l1!.val < l2!.val {
                node.next = l1!
                l1 = l1!.next
            } else {
                node.next = l2!
                l2 = l2!.next
            }
            node = node.next!
        }
        node.next = l1 ?? l2
        
        return dummy.next
    }
}
// @lc code=end

