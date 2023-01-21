//
//  142.环形链表II.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2022/8/22.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/linked-list-cycle-ii/

import Foundation

extension Solution {
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if (head == nil) { return head }
        // 快慢指针
        var fast = head, slow = head
        
        while true {
            // 没有环
            if (fast == nil || fast?.next == nil) {
                return nil
            }
            fast = fast?.next?.next
            slow = slow?.next
            // 当fast == slow时， 两指针在环中 第一次相遇
            if fast === slow { break }
        }
        // 快指针拿到最前面
        fast = head
        while true {
            // 追上了慢指针结束
            if fast === slow { break }
            fast = fast?.next
            slow = slow?.next
        }
        return fast
    }
//    一、分析快慢指针的特点：
//    分析快慢 指针在环中 第一次相遇 时走过的 步数关系 ：
//    设链表共有 a + b 个节点，其中 链表头部到链表入口 有 a 个节点（不计链表入口节点），
//    链表环 有 b 个节点（这里需要注意， a 和 b 是未知数
//    设两指针分别走了 f、s 步，则有：fast 走的步数是slow步数的 2 倍，即 f = 2s
//    （解析：fast 每轮走 2 步） fast 比 slow 多走了 n 个环的长度， 即 f = s + nb
//    双指针都走过 a 步，然后在环内绕圈直到重合，重合时 fast 比 slow 多走 环的长度整数倍
//    以上两式相减得 s = nb、f = 2nb 即 fast 和 slow 指针分别走了 2n， n 个 环的周长
//    注意：n 是未知数，不同链表的情况不同
    
//    二、根据特点求解
//    如果让指针从链表头部一直向前走k步，那么走到链表入口节点时的步数是：k = a + nb
//    （先走 a 步到入口节点，之后每绕 1 圈环（ b 步）都会再次到入口节点）
//    而目前，slow 指针走过的步数为 nb 步。因此，我们只要想办法让 slow 再走 a 步停下来，就可以到环的入口。
//    但是我们不知道 a 的值，该怎么办？依然是使用双指针法。
//    我们构建一个head指针，和slow 一起向前走 a 步后，两者可在入口节点重合
}


// 给定一个链表的头节点  head ，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
// 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。
// 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。
// 如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

//不允许修改 链表。

//示例 1：
//输入：head = [3,2,0,-4], pos = 1
//输出：返回索引为 1 的链表节点
//解释：链表中有一个环，其尾部连接到第二个节点。

//示例 2：
//输入：head = [1,2], pos = 0
//输出：返回索引为 0 的链表节点
//解释：链表中有一个环，其尾部连接到第一个节点。

//示例 3：
//输入：head = [1], pos = -1
//输出：返回 null
//解释：链表中没有环。

//提示：
//链表中节点的数目范围在范围 [0, 104] 内
//-105 <= Node.val <= 105
//pos 的值为 -1 或者链表中的一个有效索引

//进阶：你是否可以使用 O(1) 空间解决此题？

