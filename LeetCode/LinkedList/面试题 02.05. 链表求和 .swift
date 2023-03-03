//
//  面试题 02.05. 链表求和 .swift
//  LinkedList
//
//  Created by 贺嘉炜 on 2023/3/3.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func test0205addTwoNumbers() {
    let l1 = LinkedList.createList([7,1,6])
    let l2 = LinkedList.createList([5,9,3])
    let sumList = LeetCode.addTwoNumbers02(l1, l2)
    LinkedList.display(sumList)
}


extension Solution {
//    32 ms 100%
//    13.8 MB 61.54%
    func addTwoNumbers02(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        var l1 = l1, l2 = l2
        var carrier = 0
        var dummy = ListNode(), cur: ListNode? = dummy

        while l1 != nil || l2 != nil {
            var val = (l1?.val ?? 0) + (l2?.val ?? 0) + carrier
            // 处理真正的加法值
            if val > 9 {
                val -= 10
                carrier = 1
            } else {
                carrier = 0
            }
            cur!.next = ListNode()
            cur = cur!.next
            cur!.val = val
            
            l1 = l1?.next
            l2 = l2?.next
        }
        // 处理进位
        if carrier > 0 {
            cur!.next = ListNode(1)
        }

        return dummy.next
    }
}
