//
//  83.删除排序链表中的重复元素.swift
//  LinkedList
//
//  Created by 贺嘉炜 on 2022/4/7.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {
    
    // 16 ms 100.00%
    // 13.8 MB 57.21%
    // 166 / 166
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        
        let dummy = ListNode()
        dummy.next = head
        
        var node = dummy
        var valueSet = Set<Int>()
        
        while let nxtNode = node.next {
            
            if valueSet.contains(nxtNode.val) {
                // 删除当前重复节点
                node.next = nxtNode.next
                continue
            }
            valueSet.insert(nxtNode.val)
            node = nxtNode
        }
        return dummy.next
    }
    
    
//    20 ms 88.94%
//    13.8 MB 51.92%
//    166 / 166
    func deleteDuplicatesSwift(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var curt = head
        // 利用排序链表的特性操作
        while curt.next != nil {
            if curt.next!.val == curt.val {
                curt.next = curt.next!.next
            } else {
                curt = curt.next!
            }
        }
        
        return head
    }
    
}

func testDeleteDuplicates() {
    
    let l1 = LinkedList.createList([1, 1, 2, 3, 3])
    LinkedList.display(l1)
    let head = LeetCode.deleteDuplicates(l1)
    LinkedList.display(head)
    
}
