//
//  Heap.swift
//  347. Top K Frequent Elements
//
//  Created by saidicaprio on 2019/4/24.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

import Foundation

/// 自定义 堆 优先级队列
class PriorityQueue {
    /// 标记大顶堆 还是 小顶堆, 默认是小顶堆
    var isMaxFlag = false
    
    var heap: [Int]
    ///  有效元素个数，也是堆最后一个元素的角标
    var count = 0
    
    init(_ max: Bool = false) {
        self.isMaxFlag = max
        // 堆元素从 角标 1 开始
        heap = [0]
    }
    
    func add(_ val: Int) {
        insert(val)
    }
    
    func poll() -> Int {
        let num = heap[1]
        heap.swapAt(1, count)
        heap.remove(at: count)
        count -= 1
        heapify()
        return num
    }
    
    func peek() -> Int {
        return heap[1]
    }
    
    /// 插入元素
    private func insert(_ element: Int) {
        count += 1
        heap.append(element)
        var j = count
        while j / 2 > 0 && comparator(heap[j], heap[j / 2]) {
            heap.swapAt(j, j / 2)
            j = j / 2
        }
    }
    
    /// 比较器
    private func comparator(_ num1: Int, _ num2: Int) -> Bool {
        if isMaxFlag {
            return num1 > num2
        } else {
            return num1 < num2
        }
    }
    
    private func heapify() {
        var index = 1
        while true {
            var postionIndex = index
            if index * 2 <= count && !comparator(heap[index], heap[index * 2]) {
                postionIndex = index * 2
            }
            
            if index * 2 + 1 <= count && !comparator(heap[postionIndex], heap[index * 2 + 1]) {
                postionIndex = index * 2 + 1
            }
            
            if postionIndex == index {
                // 说明不需要进行操作
                break
            }
            heap.swapAt(index, postionIndex)
            index = postionIndex
        }
    }
}

/// 早起小顶堆
class Heap {
    // 数组，从下标 1 开始存储数据
    var array: [Int]
    // 堆可以存储的最大数据个数
    private var max: Int
    // 堆中已经存储的数据个数
    private var count: Int

    init(_ capacity: Int) {
        array = Array.init(repeating: 0, count: capacity)
        max = capacity
        count = 0
    }

    init(_ array: [Int], capacity: Int) {
        self.array = array
        max = capacity
        count = array.count
    }

    func insert(_ item: Int) {
        guard count < max else {// 堆满了
            return
        }
        array.append(item)
        var i = count
        var parent = (i - 1) / 2
        // 自下往上堆化 如果父节点小于插入节点那么交换位置
        while parent >= 0 && array[i] > array[parent] {
            //交换下标为 i 和 i/2 的两个元素
            (array[i], array[parent]) = (array[parent], array[i])
            i = parent
            parent = (i - 1) / 2
        }
    }

    func removeMax() {
        guard count > 0 else {
            return
        }
        array[0] = array.last!
        count -= 1
        array.removeLast()
        var i = 0
        while true {
            var k = i
            if ((i * 2 + 1) < count && array[i] < array[i * 2 + 1]) {
                k = i * 2 + 1
            } else if ((i * 2 + 2) < count && array[i] < array[i * 2 + 2]) {
                k = i * 2 + 2
            }
            guard k != i else {
                return
            }
            (array[i], array[k]) = (array[k], array[i])
            i = k
        }
    }

}


