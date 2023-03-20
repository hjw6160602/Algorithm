//
//  84. 柱状图中最大的矩形 .swift
//  Stack.Queue
//
//  Created by 贺嘉炜 on 2023/3/19.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func test84largestRectangleArea() {
    let heights = [4,2,0,3,2,5]
//    let heights = [2,1,5,6,2,3]
//    let heights = [4,2,3]
//    let heights = [5,4,1,2]
//    let heights = [0,1,0,1]
//    let heights = [2,1,2]
    let x = LeetCode.largestRectangleArea(heights)
    print(x)
    
}

extension Solution {
//    652 ms 77.78%
//    18.1 MB 33.33
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var heights = [0] + heights + [0], stack: [Int] = [0], res = 0
        for (i, height) in heights.enumerated() {
            while heights[stack.last!] > height {
                // area = width * height 注意这里必选先算高度 才能压缩到一行
                res = max(res, heights[stack.removeLast()] * (i - stack.last! - 1))
            }
            stack.append(i)
        }
        return res
    }
    
//    644 ms 88.89%
//    18 MB 44.44%
    func largestRectangleAreaV2(_ heights: [Int]) -> Int {
        let n = heights.count
        var stack = [Int]()
        var res = 0
//        var areas = Array(repeating: 0, count: n + 1)
        // 首尾增加哨兵
        var nums = Array(repeating: 0, count: n + 2)
        for i in 0..<n {
            nums[i+1] = heights[i]
        }
        stack.append(0)
        for i in 1...n+1 {
            // 单调性发生了改变需要对之前的栈内元素进行pop
            while nums[stack.last!] > nums[i] {
                let last = stack.removeLast()
                let height = nums[last]
                // 算出当前出栈元素的宽度
                let width = i - stack.last! - 1
                let area = width * height
//                areas[last] = area
                res = max(res, width * height)
            }
            // 数据一定会入栈一次 所以在这里提前defer处理
            stack.append(i)
        }
        return res
    }
    
//    692 ms 11.11%
//    17.9 MB 55.56
    func largestRectangleAreaV1(_ heights: [Int]) -> Int {
        let n = heights.count
        var stack = [Int]()
        var areas = Array(repeating: 0, count: n)
        var res = 0
        for i in 0..<n {
            let height = heights[i]
            // 无论如何最后时刻 数据一定会入栈一次 所以在这里提前defer处理
            defer { stack.append(i) }
            
            // 栈为空，那么直接入栈
            guard let peek = stack.last else { continue }
            
            // 单调性没有发生改变那么直接入栈
            if heights[peek] <= height { continue }
            
            // 单调性发生了改变需要对之前的栈内元素进行pop
            while let last = stack.last,
                  heights[last] > height {
                let height = heights[stack.removeLast()]
                // 算出当前出栈元素的宽度
                var width = 0
                // 如果栈为空了 那么这个最后的元素一定是 整个列表里最低的元素
                if stack.isEmpty {
                    // 那么它的宽度等于当前下标的值
                    width = i
                } else {
                    width = i - stack.last! - 1
                }
                let area = width * height
                areas[last] = area
                res = max(res, area)
            }
        }
        // 对栈内剩下的数据做处理
        while let last = stack.last {
            let height = heights[stack.removeLast()]
            // 如果栈为空了 那么这个最后的元素一定是 整个列表里最低的元素，所以width默认初始化为n
            var width = n
            if !stack.isEmpty {
                // 如果栈还有值那么栈底的元素去相减 n - first.index 作为宽度
                width = n - stack.last! - 1
            }
            let area = width * height
            areas[last] = area
            res = max(res, area)
        }
        return res
    }
    
    // 超出时间限制 95/98
    func largestRectangleAreaWrong(_ heights: [Int]) -> Int {
        let n = heights.count
//        var areas = Array(repeating: 0, count: n)
        var res = 0
        for k in 0..<heights.count {
            let height = heights[k]
            var i = k-1, j = k+1
            
            while i >= 0 && height <= heights[i] {
                i -= 1
            }
            while j < n && height <= heights[j] {
                j += 1
            }
            let area = (j - i - 1) * height
            res = max(res, area)
//            areas[k] = area
        }
        return res
    }
    
    
}
