//
//  BubbleSort.swift
//  Sort
//
//  Created by saidicaprio on 2019/5/21.
//  Copyright © 2019 saidicaprio. All rights reserved.
//


func bubbleSort<T: Comparable>(_ array: inout [T]) {
    guard array.count > 1 else { return }
    
    let n = array.count
    for i in 0 ..< n {
        for j in 0 ..< n - 1 - i {
            if array[j] > array[j+1] {
                (array[j], array[j+1]) = (array[j+1], array[j])
            }
        }
    }
}
