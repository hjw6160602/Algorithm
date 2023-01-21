//
//  main.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/2/2.
//  Copyright © 2021 saidicaprio. All rights reserved.
//


let LeetCode = Solution.shared

class Solution {
    static let shared = Solution()
    
    private init() {}
}

//test25EqualNode()
//test148sortList()
// 两数之和
//testAddSum()
// 翻转链表
//testReverseList()
// 合并两个有序链表
//testMergeTwoLists()
//
//testGetIntersectionNode()
//
//testRemoveElements()
// 分隔链表
//testPartition()
// 回文链表
testIsPalindrome()
// 删除排序链表中的重复元素
//testDeleteDuplicates()
//test23MergeKLists()
//test19removeNthFromEnd()
//testOffer24ReverseList()
//test22GetKthFromEnd()
//test237DeleteNode()

private func testRemveElement() {
    let list = LinkedList.createList([1, 2, 1])
    LinkedList.display(list)
    let head = LeetCode.removeElements(list, 1)
    LinkedList.display(head)
}
