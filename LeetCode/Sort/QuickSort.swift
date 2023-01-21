//
//  QuickSort.swift
//  Sort
//
//  Created by saidicaprio on 2019/5/21.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}
