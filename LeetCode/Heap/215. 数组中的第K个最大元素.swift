//
//  215. 数组中的第K个最大元素.swift
//  Array
//
//  Created by SaiDiCaprio on 2022/7/19.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/kth-largest-element-in-an-array

import Foundation


class FindKthLargest {

//    4448 ms 5.26%
//    17.8 MB 5.27%
    
    ///
    var heap = [Int]()
    ///
    var count = 0
    ///
    var capacity = 1
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        capacity = nums.count + 1
        // 这里指定容量 方便append 的时候不用扩容数组操作
        self.heap = Array(repeating: 0, count: capacity)
        for num in nums {
            self.insert(val: num)
        }
        var num = 0
        for _ in 0..<k {
            num = self.poll()
        }
        return num
    }
    
    private func insert(val: Int) {
        guard count <= capacity else { return }
        // 堆中的元素从第1个下标开始方便写子节点
        count += 1
        heap[count] = val
        var cur = count
        while (cur >> 1) > 0 && heap[cur] > heap[cur >> 1] {
            heap.swapAt(cur, cur >> 1)
            cur >>= 1
        }
    }
    
    private func poll() -> Int {
        let head = heap[1]
        heap[1] = heap[count]
        count -= 1
        _heapify()
        return head
    }
    
    // 自上往下堆化 这种情况只在删除顶部节点的时候用到
    private func _heapify() {
        var cur = 1
        while true {
            var postionIndex = cur
            let left = cur * 2, right = cur * 2 + 1
            if left <= count && heap[cur] < heap[left] {
                postionIndex = left
            }
            /**
             * 这里确保了2件事
             * 1. 是如果上面的if成立 那么肯定已经要和left节点换
                  在这种情况下 如果 right节点比较大 那么将right节点换上去 确保了 更大大的节点在上面
             * 2. 是如果上面的if不成立 那么和right子节点直接判断看是否需要交换
             */
            if right <= count && heap[postionIndex] < heap[right] {
                postionIndex = right
            }
            if postionIndex == cur {
                // 说明不需要进行任何交换操作了 退出循环
                break
            }
            heap.swapAt(postionIndex, cur)
            cur = postionIndex
        }
    }
}

func test215FindKthLargest() {
//    let x = LeetCode.findKthLargestP1([4,6], 2)
    let x = FindKthLargest().findKthLargest([3,2,3,1,2,4,5,5,6], 4)
    print(x)
}

extension Solution {
//    452 ms 5.26%
//    18.2 MB 5.27%
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let sorted = nums.sorted()
        return sorted[nums.count - k]
    }
    
//    424 ms 5.26%
//    18 MB 5.27%
    func findKthLargestP1(_ nums: [Int], _ k: Int) -> Int {
        
        var nums = nums, isFind = false
        quickSort(&nums, 0, nums.count - 1, isFind: &isFind, k: nums.count - k)
        return nums[nums.count - k]
    }
    
    private func quickSort(_ nums: inout [Int], _ low: Int, _ high: Int, isFind: inout Bool, k: Int) {
        guard !isFind, low < high else {
            return
        }
        // 指定基准值
        let pivot = nums[low]
        // 确定左右指针位置
        var l = low, r = high
        
        while l < r {
            while l < r && nums[r] >= pivot {
                r -= 1
            }
            while l < r && nums[l] <= pivot {
                l += 1
            }
            if l < r {
                nums.swapAt(l, r)
            }
        }
        
        // 当左右指针相遇 交换基准值位置
        nums.swapAt(l, low)
        
        guard l != k else {
            isFind = true
            return
        }
        
        if low < l {
            quickSort(&nums, low, l-1, isFind: &isFind, k: k)
        }
        if r < high {
            quickSort(&nums, r + 1, high, isFind: &isFind, k: k)
        }
    }
    
}

//给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。
//请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
//
//示例 1: [64]
//输入: [3,2,1,5,6,4], k = 2
//输出: 5
//
//示例 2:
//输入: [3,2,3,1,2,4,5,5,6], k = 4
//输出: 4
//
//提示：
//1 <= k <= nums.length <= 104
//-104 <= nums[i] <= 104
