//
//  703.数据流中的第 K 大元素.swift
//  Array
//
//  Created by SaiDiCaprio on 2021/3/15.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/kth-largest-element-in-a-stream

import Foundation

// 请实现 KthLargest 类
class KthLargest {
    ///
    var k = 0
    ///
    var heap: [Int] = [0]
    ///
    var count = 0

//    // 使用整数 k 和整数流 nums 初始化对象
//    init(_ k: Int, _ nums: [Int]) {
//        self.k = k
////        _heapify()
//        for num in nums {
//            insert(num)
//        }
//        print(heap)
//    }
//
//    // 将 val 插入数据流 nums 后，返回当前数据流中第 k 大的元素
//    func add(_ val: Int) -> Int {
//        insert(val)
//        return heap[k]
//    }
//
//    func insert(_ key: Int) {
//        count += 1
//        heap.append(key)
//        var j = count
//        while j / 2 > 0 && heap[j] < heap[j / 2] {
//            heap.swapAt(j, j / 2)
//            j = j / 2
//        }
//    }

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        heap = [Int](repeating: 0, count: k + 1)

        for num in nums {
            let _ = add(num)
        }
    }

    func add(_ val: Int) -> Int {
        if count < k {
            insert(val)
        } else if val > heap[1] {
            heap[1] = val
            _heapify()
        }
        return heap[1]
    }


    func insert(_ key: Int) {
        count += 1
        heap[count] = key;
        var j = count
        while j / 2 > 0 && heap[j] < heap[j / 2] {
            heap.swapAt(j, j / 2)
            j = j / 2
        }
    }
    
    // 堆化
    private func _heapify() {
        let n = heap.count
        var i = 1
        // [4, 5, 8, 2]
        while true {
            var k = i
            // 左子节点的下标 是 i * 2
            if i * 2 < n && heap[i * 2] < heap [i] {
                // 有左子节点 并且左子节点的值 比父节点的值 小
                k = i * 2
            } else if i * 2 + 1 < n && heap[i * 2 + 1] < heap [i] {
                // 右子节点的下标 是 i * 2 + 1
                // 有右子节点 并且右子节点的值 比父节点的值 小
                k = i * 2 + 1
            }
            // 下标相等 不需要交换
            guard i != k else { break }
            // 交换子节点和父节点的值
            (heap[i], heap[k]) = (heap[k], heap[i])
            // 从上往下建堆
            i = k
        }
    }
}

func testKthLargest() {
    let k = 3
    let nums = [4, 5, 8, 2]
//    let nums = [8, 5, 4, 2]
    let kLargest = KthLargest(k, nums)
    let adds = [3, 5, 10, 9, 4]
    
    for val in adds {
        let res1 = kLargest.add(val)
        print(res1)
    }
//    .add(3);   // return 4
//    .add(5);   // return 5
//    .add(10);  // return 5
//    .add(9);   // return 8
//    .add(4);   // return 8
    
}

//["KthLargest","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add","add"]
//[[7,[-10,1,3,1,4,10,3,9,4,5,1]],[3],[2],[3],[1],[2],[4],[5],[5],[6],[7],[7],[8],[2],[3],[1],[1],[1],[10],[11],[5],[6],[2],[4],[7],[8],[5],[6]]
//[null,4,4,4,4,4,4,4,3,5,5,6,7,7,7,7,7,7,7,9,9,9,9,9,9,9,9,9]
//[null,3,3,3,3,3,3,4,4,4,5,5,5,5,5,5,5,5,6,7,7,7,7,7,7,7,7,7]

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */

// 设计一个找到数据流中第 k 大元素的类（class）。
// 注意是排序后的第 k 大元素，不是第 k 个不同的元素。

// 示例：
// 输入：
// ["KthLargest", "add", "add", "add", "add", "add"]
// [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
// 输出：
// [null, 4, 5, 5, 8, 8]

// 解释：
// KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
// kthLargest.add(3);   // return 4
// kthLargest.add(5);   // return 5
// kthLargest.add(10);  // return 5
// kthLargest.add(9);   // return 8
// kthLargest.add(4);   // return 8

// 提示：
// 1 <= k <= 104
// 0 <= nums.length <= 104
// -104 <= nums[i] <= 104
// -104 <= val <= 104
// 最多调用 add 方法 104 次
// 题目数据保证 在查找第 k 大元素时 数组中至少有 k 个元素

