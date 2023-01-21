//
//  295. 数据流的中位数.swift
//  Heap
//
//  Created by SaiDiCaprio on 2022/7/12.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/find-median-from-data-stream

import Foundation


//1328 ms 41.67%
//21 MB 25.00%
//21 / 21
class MedianFinder {
    /** 小顶堆 */
    var minHeap = PriorityQueue()
    /** 大顶堆 在这里保证大顶堆长度比小顶堆长度大1 其实反过来也是一样的 */
    var maxHeap = PriorityQueue(true)
    
    init() {}
    
    func addNum(_ num: Int) {
        // 如果当前两个堆的元素个数相等
        if minHeap.count == maxHeap.count {
            // 为了保证maxHeap多一个元素 所以先进minHeap
            minHeap.add(num)
            maxHeap.add(minHeap.poll())
        } else {
        // 如果目前 count 是 奇数，很明显，大顶堆的个数 = 小顶堆的个数 + 1
        // 所以我们需要让大顶堆匀一个给小顶堆，因此，我们先将元素插入到大顶堆，然后从大顶堆 取出堆顶，插入到小顶堆即可
            maxHeap.add(num)
            minHeap.add(maxHeap.poll())
        }
    }
    
    func findMedian() -> Double {
        var res = 0.0
        if minHeap.count == maxHeap.count {
            res = Double(minHeap.peek() + maxHeap.peek()) / 2
        } else {
            res = Double(maxHeap.peek())
        }
//        print(res)
        return res
    }
}

func test295MedianFinder() {
    let x = MedianFinder()
    
    x.addNum(1)
    x.addNum(2)
    _ = x.findMedian()
    x.addNum(3)
    _ = x.findMedian()
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */

//中位数是有序列表中间的数。如果列表长度是偶数，中位数则是中间两个数的平均值。
//
//例如，
//
//[2,3,4] 的中位数是 3
//
//[2,3] 的中位数是 (2 + 3) / 2 = 2.5
//
//设计一个支持以下两种操作的数据结构：
//
//void addNum(int num) - 从数据流中添加一个整数到数据结构中。
//double findMedian() - 返回目前所有元素的中位数。

//示例：


//进阶:
//如果数据流中所有整数都在 0 到 100 范围内，你将如何优化你的算法？
//如果数据流中 99% 的整数都在 0 到 100 范围内，你将如何优化你的算法？
