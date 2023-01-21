//
//  Top10BigestNo..swift
//  347. Top K Frequent Elements
//
//  Created by saidicaprio on 2019/4/26.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

import Foundation

class TopKBigestNo {
    func topKBigest(_ nums: [Int], _ k: Int) -> [Int]  {
        // 这里先把结果数组初始化为传入大数据的第一个数字
        var res: [Int] = [nums[0]]
        for item in nums {
            // 与堆顶元素比较 只有大于堆顶元素再操作
            guard item > res[0] else {
                continue
            }
            if res.count < k {
                heapInsert(item, in: &res)
            } else {
                // 直接将堆顶元素替换掉 然后开始堆化整个数组
                res[0] = item
                __heapify(&res)
            }
        }
        return res
    }
    
    func heapRemoveMin(_ array: inout [Int], _ n: Int) {
        (array[0], array[n]) = (array[n], array[0])
        array.remove(at: n)
        __heapify(&array)
    }
    
    func heapInsert(_ item: Int, in array: inout [Int]) {
        var i = array.count
        //这里注意一定要先加入到数组中来
        array.append(item)
        // 父节点下标
        var parent = (i - 1) / 2
        while parent >= 0 && array[parent] > array[i]  {
            (array[i], array[parent]) = (array[parent], array[i])
            i = parent
            parent = (i - 1) / 2
        }
    }
    
    func __heapify(_ array: inout [Int]) {
        let n = array.count
        var i = 0
        while true {
            var k = i
            if i * 2 + 1 < n && array[i * 2 + 1] < array [i] {
                k = i * 2 + 1
            } else if i * 2 + 2 < n && array[i * 2 + 2] < array [i] {
                k = i * 2 + 2
            }
            guard i != k else {
                break
            }
            (array[i], array[k]) = (array[k], array[i])
            i = k
        }
    }
    
    func generateNums(_ capacity: Int) -> [Int] {
        var array = Array.init(repeating: 0, count: capacity)
        for index in 0..<capacity {
            let num: Int = Int(arc4random() % UInt32(capacity)) + 1
            array[index] = num
        }
        return array
    }
}


