/*
 * @lc app=leetcode.cn id=328 lang=swift
 *
 * [328] 奇偶链表
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
    // 28 ms 3.33%
    // 14.8 MB 30%
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var dummy = ListNode(), evenDummy = ListNode()
        var node = head, prevOdd: ListNode? = dummy, prevEven: ListNode? = evenDummy
        var isOdd = true
        while node != nil {
            if isOdd {// 当前节点是奇数
                prevOdd?.next = node
                prevOdd = node
            } else {
                prevEven?.next = node
                prevEven = node
            }
            node = node!.next
            // 奇偶性标记置反
            isOdd = !isOdd
        }
        prevOdd?.next = evenDummy.next
        // 将最后一个偶数节点的next指针置为nil
        prevEven?.next = nil
        return dummy.next
    }
}
// @lc code=end

