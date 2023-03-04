//
//  399. 除法求值 .swift
//  图
//
//  Created by 贺嘉炜 on 2023/3/4.
//  Copyright © 2023 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/evaluate-division/description/

import Foundation

func test399calcEquation() {
    let equations = [["a","b"],["b","c"]], values = [2.0,3.0]
    let queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
    let res = LeetCode.calcEquation(equations, values, queries)
    print(res)
}

//4 ms 100%
//14.6 MB 57.14%
extension Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        let n = equations.count
        let uf = UnionFindWeighted.init(2 * n)
        
        // 预处理：将变量的值String与Int类型的id进行映射，是的并查集底层用数组实现方便编码
        var map = [String: Int]()
        var id = 0
        for i in 0..<equations.count {
            let equation = equations[i]
            // 拿到两个字符数 对应 var1被除数 和 var2除数
            let var1 = equation[0], var2 = equation[1]
            // 在填map映射过程中，如果发现字符数没有做过映射，那么对id进行+1操作
            if map[var1] == nil {
                map[var1] = id
                id += 1
            }
            // 在填map映射过程中，如果发现字符数没有做过映射，那么对id进行+1操作
            if map[var2] == nil {
                map[var2] = id
                id += 1
            }
            // 利用并查集将两个数字连通
            uf.union(p: map[var1]!, q: map[var2]!, val: values[i])
        }
        // 这里初始化 一个结果数组
        var res = Array(repeating:Double(0), count: queries.count)
        for i in 0..<queries.count {
            // 拿到当前的这次查询
            let query = queries[i]
            // 拿到 两个需要查询的 被除数 和 除数
            let var1 = query[0], var2 = query[1]
            // 根据拿到的两个数去哈希表中查询id
            let id1 = map[var1], id2 = map[var2]
            // 在填写的哈希map中同时找得到两个字符数字才能去做运算，否则返回-1
            if let id1 = id1, let id2 = id2 {
                // 将两个id节点 进行合并
                res[i] = uf.isConnected(id1, id2)
            } else {
                // 如果查不到就证明这个结果不存在 结果数组中的值为-1
                res[i] = -1.0
            }
        }
        return res
    }
}

class UnionFindWeighted {
    // 这里保存的是其连通分量的根节点
    var parent = [Int]()
    /// 节点指向父节点的权值
    var weight = [Double]()
    
    // 初始化方法
    init(_ n: Int) {
        self.parent = Array(repeating: 0, count: n)
        self.weight = Array(repeating: Double(0), count: n)
        // 将节点的指针指向自己
        for i in 0..<n {
            self.parent[i] = i
            // 自己和自己的比值等于1
            self.weight[i] = 1.0
        }
        
    }
    
    // 合并操作
    func union(p: Int, q: Int, val: Double) {
        let rootP = find(p)
        let rootQ = find(q)
        if rootP == rootQ {
            return
        }
        parent[rootP] = rootQ
        // 同步更新 权重数组，合并两个连通分量之后
        weight[rootP] = weight[q] * val / weight[p]
    }
    
    // 动态查找和路径压缩
    func find(_ x: Int) -> Int {
        if x != parent[x] {
            // 线保存原来的根节点
            let origin = parent[x]
            parent[x] = find(parent[x])
            // 同步更新权值
            weight[x] *= weight[origin]
        }
        // 这里返回的是其根节点
        return parent[x]
    }
    
    // 返回是否连通，如果连通是两个节点的比值，如果不连通返回-1
    func isConnected(_ p: Int, _ q: Int) -> Double {
        let rootP = find(p)
        let rootQ = find(q)
        if rootP == rootQ {
            // 如果连通，那么返回其指向根节点的权值的比值
            return weight[p] / weight[q]
        } else {
            // 如果不连通，那么返回-1
            return -1.0
        }
    }
}
