//
//  990.等式方程的可满足性.swift
//  图
//
//  Created by 贺嘉炜 on 2023/3/5.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func test990equationsPossible() {
    let equations = ["a==b","b!=a"]
    let x = SolutionPossible().equationsPossible(equations)
    print(x)
}

class SolutionPossible {

//    16 ms 66.67%
//    14.2 MB 44.44%
    func equationsPossible(_ equations: [String]) -> Bool {
        let uf = UF(26)
        // 找出所有等式，然后将其并查集合并
        for i in 0..<equations.count {
            let equation = Array(equations[i])
            
            guard equation[1] == "=" else {
                continue
            }
            
            let x = Int(equation[0].asciiValue!) - 97
            let y = Int(equation[3].asciiValue!) - 97
            
            uf.union(p: x, q: y)
        }
        // 找出所有的不等式，查看是否和并查集冲突
        for i in 0..<equations.count {
            let equation = Array(equations[i])
            
            guard equation[1] == "!" else {
                continue
            }
            let x = Int(equation[0].asciiValue!) - 97
            let y = Int(equation[3].asciiValue!) - 97
            
            let isConnected = uf.isConnected(p: x, q: y)
            if isConnected {
                // 只要发现一个和并查集查询结果相反 的就立刻返回false
                return false
            }
        }
        // 查询并查集后没有歧义，就返回true
        return true
    }
    
    class UF {
        ///
        var parent = [Int]()
        
        init(_ count: Int) {
            parent = Array.init(repeating: 0, count: count)
            for i in 0..<count {
                parent[i] = i
            }
        }
        
        func union(p: Int, q: Int) {
            let rootP = find(p)
            let rootQ = find(q)
            if rootP == rootQ {
                return
            }
            parent[rootP] = rootQ
        }
        
        func isConnected(p: Int, q: Int) -> Bool {
            let rootP = find(p)
            let rootQ = find(q)
            
            return rootP == rootQ
        }
        
        /// 动态压缩路径 递归压缩层一层
        func find(_ x: Int) -> Int {
            if parent[x] != x  {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        /// 隔代压缩
        func find2(_ x: Int) -> Int {
            var x = x
            while x != parent[x] {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
    }
}

