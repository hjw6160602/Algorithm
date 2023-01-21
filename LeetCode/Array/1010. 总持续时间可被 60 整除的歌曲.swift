//
//  1010. 总持续时间可被 60 整除的歌曲.swift
//  Array
//
//  Created by 贺嘉炜 on 2022/6/27.
//  Copyright © 2022 saidicaprio. All rights reserved.
//

import Foundation

extension Solution {

//    196 ms 100.00%
//    15.7 MB 50.00%
//    35 / 35
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var seconds = Array(repeating: 0, count: 60)
        var counter = 0
        for t in time {
            seconds[t % 60] += 1
        }
        counter += seconds[0] * (seconds[0] - 1) / 2
        counter += seconds[30] * (seconds[30] - 1) / 2
        
        var i = 1, j = 59
        while i < j {
            counter += seconds[i] * seconds[j]
            i += 1
            j -= 1
        }
        
        return counter
    }
}

func test1010NumPairsDivisibleBy60() {
    let time = [30,20,150,100,40]
    let res = LeetCode.numPairsDivisibleBy60(time)
    print(res)
}

//1010. 总持续时间可被 60 整除的歌曲
//在歌曲列表中，第 i 首歌曲的持续时间为 time[i] 秒。
//
//返回其总持续时间（以秒为单位）可被 60 整除的歌曲对的数量。形式上，我们希望下标数字 i 和 j 满足  i < j 且有 (time[i] + time[j]) % 60 == 0。

//示例 1：
//输入：time = [30,20,150,100,40]
//输出：3
//解释：这三对的总持续时间可被 60 整除：
//(time[0] = 30, time[2] = 150): 总持续时间 180
//(time[1] = 20, time[3] = 100): 总持续时间 120
//(time[1] = 20, time[4] = 40): 总持续时间 60

//示例 2：
//输入：time = [60,60,60]
//输出：3
//解释：所有三对的总持续时间都是 120，可以被 60 整除。

//提示：
//1 <= time.length <= 6 * 104
//1 <= time[i] <= 500
