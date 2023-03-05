//
//  UnionFind.swift
//  Array
//
//  Created by 贺嘉炜 on 2023/3/4.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

public class UF {
    // 连通分量个数
    private(set) var count = 0
    
    // 存储每个节点的父节点
    private var parent = [Int]()
    
    // n 为图中节点的个数
    init(_ n: Int = 0) {
        count = n
        parent = Array(repeating: 0, count: n)
        // 每个节点都在初始化的时候指向自己
        for i in 0..<n {
            parent[i] = i
        }
    }
    
    public func union(p: Int, q: Int) {
        let rootP = find(p)
        let rootQ = find(q)
        if rootP == rootQ {
            return
        }
        // 将q所在的分量的根节 点指向p所在分量的根节点
        parent[rootQ] = rootP
        // 两个连通分量合并成一个连通分量
        count -= 1
    }
    
    // 判断节点 p 和节点 q 是否连通
    public func isConnected(p: Int, q: Int) -> Bool {
        let rootP = find(q)
        let rootQ = find(q)
        return rootP == rootQ
    }
    
    // 核心方法 边查找边进行路径压缩
    public func find(_ x: Int) -> Int {
        if (parent[x] != x) {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
}

class UF2 {
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
    
    /// 动态压缩路径
    func find(_ x: Int) -> Int {
        if parent[x] != x  {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
}
