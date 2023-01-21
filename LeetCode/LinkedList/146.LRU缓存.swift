//
//  146.LRU缓存.swift
//  LinkedList
//
//  Created by 贺嘉炜 on 2022/7/18.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/lru-cache

import Foundation

class LRUCache1 {

//    1148 ms 85.41%
//    30.7 MB 75.68%
    var cache = [Int: CacheNode]()
    /// 容量
    var capacity: Int
    /// 虚拟头节点
    let first = CacheNode()
    /// 虚拟尾结点
    var last = CacheNode()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        first.next = last
        last.prev = first
    }
    
    func get(_ key: Int) -> Int {
        guard let node = cache[key] else {
            return -1
        }
        removeNode(node)
        addAfterFirst(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        // 已经存在于缓存中了 更新value
        if let node = cache[key] {
            removeNode(node)
            node.value = value
            addAfterFirst(node)
            cache[key] = node
            return
        }
        // 来到这里证明是全新的节点
        let freshNode = CacheNode(key: key, value: value)
        if cache.count == capacity {
            // 缓存满了 淘汰最近最少使用的cache
            if let node = cache.removeValue(forKey: self.last.prev!.key) {
                removeNode(node)
            }
        }
        addAfterFirst(freshNode)
        cache[key] = freshNode
    }
    
    
    /// 从双向链表中删除node节点
    private func removeNode(_ node: CacheNode) {
        let preNode = node.prev
        let nxtNode = node.next
        
        preNode?.next = nxtNode
        nxtNode?.prev = preNode
    }
    
    /// 将node节点插入到first节点的后面
    private func addAfterFirst(_ node: CacheNode) {
        let nxtNode = first.next
        node.next = nxtNode
        nxtNode?.prev = node
        
        first.next = node
        node.prev = first
    }
    
    // 内部类
    class CacheNode {
        var key: Int = 0
        var value: Int = 0
        var prev: CacheNode?
        var next: CacheNode?
        
        init() {}
        
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }
}


//请你设计并实现一个满足  LRU (最近最少使用) 缓存 约束的数据结构。
//实现 LRUCache 类：
//LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存
//int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
//void put(int key, int value) 如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。
//函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。

//示例：
//输入
//["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
//[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
//输出
//[null, null, null, 1, null, -1, null, -1, 3, 4]

//解释
//LRUCache lRUCache = new LRUCache(2);
//lRUCache.put(1, 1); // 缓存是 {1=1}
//lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
//lRUCache.get(1);    // 返回 1
//lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
//lRUCache.get(2);    // 返回 -1 (未找到)
//lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
//lRUCache.get(1);    // 返回 -1 (未找到)
//lRUCache.get(3);    // 返回 3
//lRUCache.get(4);    // 返回 4
//
//提示：
//1 <= capacity <= 3000
//0 <= key <= 10000
//0 <= value <= 105
//最多调用 2 * 105 次 get 和 put
