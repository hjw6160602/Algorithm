//
//  main.swift
//  Search
//
//  Created by SaiDiCaprio on 2022/7/4.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation
let LeetCode = Solution.shared

class Solution {
    static let shared = Solution()
    
    private init() {}
}

extension String {
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
}


test287findDuplicate()
//test240searchMatrix()
//test733FloodFill()
//test278FirstBadVersion()
//test33Search()
//test4findMedianSortedArrays()
//test200NumIslands()
//test34SearchRange()
//testUniquePaths()
//test39CombinationSum()
//test79Exist()


// MARK: - 排列组合
//test46Permute()
//testCombine()
//testLetterCombinations()
//test47PermuteUnique()
//test78Subsets()
