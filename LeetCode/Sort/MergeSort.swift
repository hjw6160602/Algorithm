//
//  MergeSort.swift
//  Sort
//
//  Created by saidicaprio on 2019/5/21.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

/**
 2. 将n/2个包含2个元素的序列归并，形成 n/4个 序列，每个序列包含4个元素
 3. 重复步骤2，直到所有元素排序完毕
*/
func merge(_ array: inout [Int], first: Int, mid: Int, last: Int){
    var tempArray = [Int]()
    var indexA = first
    var indexB = mid
    
    while indexA < mid && indexB < last {
        if array[indexA] < array[indexB]{
            tempArray.append(array[indexA])
            indexA += 1
        } else {
            tempArray.append(array[indexB])
            indexB += 1
        }
    }
    
    while indexA < mid {
        tempArray.append(array[indexA])
        indexA += 1
    }
    
    while indexB < last {
        tempArray.append(array[indexB])
        indexB += 1
    }
    
    var index = 0
    for item in tempArray {
        array[first + index] = item
        index += 1
    }
    
    print("\(array), first: \(first), mid: \(mid), last: \(last)")
}

func __classify(_ array: inout [Int], first: Int, last: Int) {
    guard first + 1 < last else {
        return
    }
    
    let mid =  first + (last - first) / 2
    // 将序列每相邻两个数字进行【归】操作，形成 n/2 个序列
    __classify(&array, first: first, last: mid)
    __classify(&array, first: mid, last: last)
    // 每个序列包含元素进行排序的【并】操作
    merge(&array, first: first, mid: mid, last: last)
}

func mergeSort(_ array: inout [Int]) {
    __classify(&array, first: 0, last: array.count)
}
