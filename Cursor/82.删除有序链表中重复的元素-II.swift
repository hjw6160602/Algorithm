// https://leetcode.cn/problems/remove-duplicates-from-sorted-list-ii/description/
// 删除有序链表中重复的元素-II
// 给出一个升序排序的链表，删除链表中的所有重复出现的元素，只保留原链表中只出现一次的元素。
// 例如：
// 给出的链表为
// 1 → 2 → 3 → 3 → 4 → 4 → 5
// 返回 1 → 2 → 5.
// 给出的链表为 1 → 1 → 1 → 2 → 3, 返回
// 2 → 3 

// 数据范围：链表长度 
// 10000
// 0≤n≤10000，
// 链表中的值满足  ∣val∣ ≤ 1000
// 要求：空间复杂度 O(n)，时间复杂度  O(n)
// 进阶：空间复杂度 O(1)，时间复杂度 O(n)

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    // 创建虚拟头节点
    let dummy = ListNode(0, head)
    var cur: ListNode? = dummy
    while cur?.next != nil && cur?.next?.next != nil {
        if cur?.next?.val == cur?.next?.next?.val {
            let x = cur?.next?.val
            while cur?.next != nil && cur?.next?.val == x {
                cur?.next = cur?.next?.next
            }
        } else {
            cur = cur?.next
        }
    }
    return dummy.next
}
