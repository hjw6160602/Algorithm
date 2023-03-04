//
//  [621] 任务调度器.swift
//  Array
//
//  Created by 贺嘉炜 on 2023/3/4.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func test621leastInterval() {
    let tasks:[Character] = ["A","A","A","B","B","B"]
    let x = LeetCode.leastInterval(tasks, 2)
    print(x)
}

//class Solution {
//    public int leastInterval(char[] tasks, int n) {
//        int[] temp = new int[26];
//        int countMaxTask = 0;
//        int maxTask=0;
//        for(char c:tasks){
//            temp[c-'A']++;
//            maxTask = Math.max(temp[c-'A'],maxTask);
//        }
//        for(int i=0;i<26;i++){
//            if(temp[i]==maxTask){
//                countMaxTask++;
//            }
//        }
//        return Math.max(tasks.length,(maxTask-1)*(n+1)+countMaxTask);
//    }
//}

extension Solution {
//    308 ms 100%
//    14.5 MB 85.71%
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard n > 0 else { return tasks.count }
        
        var taskCntMap = Array(repeating: 0, count: 26)
        var maxTask = 0
        for task in tasks {
            let index = Int(task.asciiValue!) - 65
            taskCntMap[index] += 1
            maxTask = max(maxTask, taskCntMap[index])
        }
        
        var cnt = 0
        for num in taskCntMap where num == maxTask {
            // 如果第1位的任务数量和第0位的任务数量个数相等，那么最后一天筒里的元素个数要增加
            cnt += 1
        }
        
        return max(tasks.count, cnt + (maxTask - 1) * (n + 1))
    }
}
