//
//  547. 省份数量 .swift
//  图
//
//  Created by 贺嘉炜 on 2023/3/5.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation


func test547FindCircleNum() {
    let isConnected = [[1,0,0],[0,1,0],[0,0,1]]
    let x = LeetCode.findCircleNum(isConnected)
    print(x)
}

extension Solution {
//    136 ms 11.54%
//    14 MB 53.85%
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        let uf = UF(n)
        for i in 0..<n {
            for j in i+1..<n {
                if isConnected[i][j] == 1{
                    uf.union(p: i, q: j)
                }
            }
        }
        return uf.count
    }
    
    class UF {
        ///
        var parent = [Int]()
        
        var count = 0
        
        init(_ n: Int) {
            self.count = n
            parent = Array.init(repeating: 0, count: n)
            for i in 0..<n {
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
            count -= 1
        }
        
        func isConnected(p: Int, q: Int) -> Bool {
            let rootP = find(p)
            let rootQ = find(q)
            
            return rootP == rootQ
        }
        
        /// 隔代压缩
        func find(_ x: Int) -> Int {
            var x = x
            while x != parent[x] {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
    }
}
