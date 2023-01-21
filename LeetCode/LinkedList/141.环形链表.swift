//
//  141.环形链表.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/2/4.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/linked-list-cycle

import Foundation


extension Solution {
//    48 ms  90.26%
//    15.3 MB 71.31%
    func hasCycle(_ head: ListNode?) -> Bool {

        var rabbit = head, turttle = head
        while true {
            rabbit = rabbit?.next
            turttle = turttle?.next?.next
            
            guard let rabbit = rabbit else {
                return false
            }
            guard let turttle = turttle else {
                return false
            }
            if rabbit === turttle {
                return true
            }
        }
    }
    
    func hasCycleP1(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }

        // 快慢指针
        var fast = head, slow = head
        
        while true {
            // 没有环
            if (fast == nil || fast?.next == nil) {
                return false
            }
            fast = fast?.next?.next
            slow = slow?.next
            
            // 有环了，退出
            if fast === slow { return true }
        }
    }
}

func testHasCycle() {
}

//给你一个链表的头节点 head ，判断链表中是否有环。
//
//如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。
//
//如果链表中存在环 ，则返回 true 。 否则，返回 false 。

//示例 1：
//输入：head = [3,2,0,-4], pos = 1
//输出：true
//解释：链表中有一个环，其尾部连接到第二个节点。
//
//示例 2：
//输入：head = [1,2], pos = 0
//输出：true
//解释：链表中有一个环，其尾部连接到第一个节点。
//
//示例 3：
//输入：head = [1], pos = -1
//输出：false
//解释：链表中没有环。
//
//
//提示：
//链表中节点的数目范围是 [0, 104]
//-105 <= Node.val <= 105
//pos 为 -1 或者链表中的一个 有效索引 。


//type ListNode struct {
//    Val int
//    Next *ListNode
//}
//
//func main()  {
//    head := &ListNode{}
//    hasCycle(head)
//}
//
//func hasCycle(head *ListNode) bool {
//    hare := head
//    tortoise := head
//    for hare != nil && tortoise != nil && tortoise.Next != nil {
//        hare = hare.Next
//        tortoise = tortoise.Next.Next
//        if hare == tortoise {
//            return true
//        }
//    }
//    return false
//}


