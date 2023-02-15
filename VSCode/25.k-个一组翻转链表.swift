/*
 * @lc app=leetcode.cn id=25 lang=swift
 *
 * [25] K 个一组翻转链表
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var a = head, b = head
        for i in 0..<k {
            if b == nil {
                return head
            }
            b = b!.next
        }
        // 反转前 k 个元素 翻转的区间为：[a, b)
        var newHead = reverse(a, b)
        // 递归反转后续链表并连接起来
        a?.next = reverseKGroup(b, k)
        return newHead

    }

    /** 反转区间 [a, b) 的元素，注意是左闭右开 */
    private func reverse(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        guard a != nil else { return  nil }

        var pre: ListNode?
        var cur = a
        // while 终止的条件改一下就行了
        while cur !== b {
            let nxt = cur?.next
            cur?.next = pre
            pre = cur
            cur = nxt
        }
        // 返回反转后的头结点
        return pre

    }
}
// @lc code=end

