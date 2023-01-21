//
//  207.课程表.swift
//  Sort
//
//  Created by SaiDiCaprio on 2022/8/5.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/course-schedule/solution/bao-mu-shi-ti-jie-shou-ba-shou-da-tong-tuo-bu-pai-/

import Foundation

// 一共有 n 门课要上，编号为 0 ~ n-1。
// 先决条件[1, 0]，意思是必须先上课 0，才能上课 1。
// 给你 n 、和一个先决条件表，请你判断能否完成所有课程。
 
// 用有向图描述依赖关系
// 示例：n = 6，先决条件表：[[3, 0], [3, 1], [4, 1], [4, 2], [5, 3], [5, 4]]
// 课 0, 1, 2 没有先修课，可以直接选。其余的课，都有两门先修课。
 
// 每次只能选你能上的课
// 每次只能选入度为 0 的课，因为它不依赖别的课，是当下你能上的课。
// 假设选了 0，课 3 的先修课少了一门，入度由 2 变 1。
// 接着选 1，导致课 3 的入度变 0，课 4 的入度由 2 变 1。
// 接着选 2，导致课 4 的入度变 0。
// 现在，课 3 和课 4 的入度为 0。继续选入度为 0 的课……直到选不到入度为 0 的课。

// 把一个 有向无环图 转成 线性的排序 就叫 拓扑排序。
extension Solution {
    
//    64 ms 92.59%
//    14 MB 92.59%
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        //  入度数组：课号 0 到 n - 1 作为索引，通过遍历先决条件表求出对应的初始入度。
        var inDegrees = Array(repeating: 0, count: numCourses)
        //  邻接表：用哈希表记录依赖关系 [课号 ：依赖这门课的后续课（数组）]
        var fromTo = [Int: [Int]]()
        
        var coursesCouldTake = [Int](), queue = [Int]()
        //  每门课的入度需要被记录，我们关心入度值的变化。
        //  课程之间的依赖关系也要被记录，我们关心选当前课会减小哪些课的入度。
        for prerequisite in prerequisites {
            inDegrees[prerequisite[0]] += 1
            // 用哈希表来存储 有向无环图的 依赖关系
            fromTo[prerequisite[1], default: []].append(prerequisite[0])
        }
        
        // 让入度为 0 的课入列，它们是能直接选的课。
        for course in 0..<numCourses where inDegrees[course] == 0  {
            queue.append(course)
        }
        
        // BFS
        while !queue.isEmpty {
            // 然后逐个出列，出列代表着课被选，需要减小相关课的入度。
            let currentCourse = queue.removeFirst()
            coursesCouldTake.append(currentCourse)
            
            guard let toCourses = fromTo[currentCourse] else {
                continue
            }
            
            for to in toCourses {
                inDegrees[to] -= 1
                if inDegrees[to] == 0 {
                    // 如果相关课的入度新变为 0，安排它入列、再出列……直到没有入度为 0 的课可入列
                    queue.append(to)
                }
            }
        }
        //  用一个变量 count 记录入列的顶点个数，最后判断 count 是否等于总课程数。
        return coursesCouldTake.count == numCourses
        // 或者 如果仍有课的入度不为 0，无法被选，完成不了所有课。否则，能找到一种顺序把所有课上完。
    }
}


func test207CanFinish() {
//    let numCourses = 2, prerequisites = [[1,0]]
//    let numCourses = 2, prerequisites = [[1,0],[0,1]]
    let numCourses = 6, prerequisites = [[3, 0], [3, 1], [4, 1], [4, 2], [5, 3], [5, 4]]
    let x = LeetCode.canFinish(numCourses, prerequisites)
    print(x)
}



//你这个学期必须选修 numCourses 门课程，记为 0 到 numCourses - 1 。
//在选修某些课程之前需要一些先修课程。 先修课程按数组 prerequisites 给出，其中 prerequisites[i] = [ai, bi] ，表示如果要学习课程 ai 则 必须 先学习课程  bi 。
//
//例如，先修课程对 [0, 1] 表示：想要学习课程 0 ，你需要先完成课程 1 。
//请你判断是否可能完成所有课程的学习？如果可以，返回 true ；否则，返回 false 。
//
//示例 1：
//输入：numCourses = 2, prerequisites = [[1,0]]
//输出：true
//解释：总共有 2 门课程。学习课程 1 之前，你需要完成课程 0 。这是可能的。
//
//示例 2：
//输入：numCourses = 2, prerequisites = [[1,0],[0,1]]
//输出：false
//解释：总共有 2 门课程。学习课程 1 之前，你需要先完成​课程 0 ；并且学习课程 0 之前，你还应先完成课程 1 。这是不可能的。
//
//提示：
//1 <= numCourses <= 10^5
//0 <= prerequisites.length <= 5000
//prerequisites[i].length == 2
//0 <= ai, bi < numCourses
//prerequisites[i] 中的所有课程对 互不相同
