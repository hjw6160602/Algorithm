//
//  455. 分发饼干.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/4/13.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/assign-cookies

import Foundation

extension Solution {
    
//    132 ms 44.00%
//    14.4 MB 6.00%
    
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        guard s.count > 0 else { return 0 }
        
        let children = g.sorted()
        let cookies = s.sorted()
        
        var index = 0
        var leftCookieIndex = 0
        for num in children {
            
            for j in leftCookieIndex..<cookies.count {
                leftCookieIndex += 1
                if cookies[j] >= num {
                    // 如果找到了 那么孩子个数增加
                    index += 1
                    break
                }
            }
            
            guard leftCookieIndex < cookies.count else {
                return index
            }
        }
        return index
    }
    
    
//    128 ms 58.00%
//    14.3 MB 18.00%
    func findContentChildrenPython(_ g: [Int], _ s: [Int]) -> Int {
        let g = g.sorted()
        let s = s.sorted()
        var i = 0, j = 0, count = 0
        while (i < g.count) && (j < s.count) {
            while (j < s.count) && (g[i] > s[j]) {
                j += 1
            }
            if j < s.count {
                count += 1
            }
            i += 1
            j += 1
        }
        return count
    }
    
//    116 ms 100.00%
//    14.2 MB 32.00%
    func findContentChildrenSwift(_ g: [Int], _ s: [Int]) -> Int {
        //双指针 + 贪心算法(最优)
        //首先对饼干和小朋友升序处理.做最小匹配以达到最优匹配效果
        let sortG: [Int] = g.sorted()
        let sortS: [Int] = s.sorted()
        //创建双指针
        var child: Int = 0
        var cookie: Int = 0
        while (child < sortG.count && cookie < sortS.count) {
            if sortG[child] <= sortS[cookie] {
                child += 1 //符合条件,孩子+1
            }
            cookie += 1 //饼干只用一次
        }
        return child
    }
}

func testFindContentChildren() {
    let x = LeetCode.findContentChildrenPython([1,2,3], [1,1])
//    let x = LeetCode.findContentChildren([1,2], [1,2,3])
    print(x)
}

//假设你是一位很棒的家长，想要给你的孩子们一些小饼干。但是，每个孩子最多只能给一块饼干。

//对每个孩子 i，都有一个胃口值 g[i]，这是能让孩子们满足胃口的饼干的最小尺寸；并且每块饼干 j，都有一个尺寸 s[j] 。如果 s[j] >= g[i]，我们可以将这个饼干 j 分配给孩子 i ，这个孩子会得到满足。你的目标是尽可能满足越多数量的孩子，并输出这个最大数值。


//示例 1:
//输入: g = [1,2,3], s = [1,1]
//输出: 1
//解释:
//你有三个孩子和两块小饼干，3个孩子的胃口值分别是：1,2,3。
//虽然你有两块小饼干，由于他们的尺寸都是1，你只能让胃口值是1的孩子满足。
//所以你应该输出1。

//示例 2:
//输入: g = [1,2], s = [1,2,3]
//输出: 2
//解释:
//你有两个孩子和三块小饼干，2个孩子的胃口值分别是1,2。
//你拥有的饼干数量和尺寸都足以让所有孩子满足。
//所以你应该输出2.

//提示：
//1 <= g.length <= 3 * 104
//0 <= s.length <= 3 * 104
//1 <= g[i], s[j] <= 231 - 1
