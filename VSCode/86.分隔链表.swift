/*
 * @lc app=leetcode.cn id=86 lang=swift
 *
 * [86] 分隔链表
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
    // 8 ms 80.56%
    // 13.8 MB 51.39%
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var node = head
        
        let dummy = ListNode(), rDummy = ListNode()
        var l1 = dummy, l2 = rDummy
        
        dummy.next = node
        while node != nil {
            let nxtNode = node!.next
            // 这句很重要！因为当前节点有可能被串到两个链表中的其中一个里面去
            // 所以为了指针混乱在这里提前将node的next指针置空
            node!.next = nil
            if node!.val < x {
                l1.next = node
                l1 = l1.next!
            } else {
                l2.next = node
                l2 = l2.next!
            }
            node = nxtNode
        }
        // 将两个链表串起来
        l1.next = rDummy.next
        
        return dummy.next
    }
}
// @lc code=end

