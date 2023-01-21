//
//  16.25 LRUCache.swift
//  LinkedList
//
//  Created by SaiDiCaprio on 2021/2/24.
//  Copyright © 2021 saidicaprio. All rights reserved.
//  https://leetcode-cn.com/problems/lru-cache-lcci/

import Foundation

// HashMap
// map
// first
// last
//
// next

class LRUCache {
    
    //    1156 ms 79.46%
    //    30.7 MB 72.43%
    var map: [Int: CacheNode] = [:]
    /// Cache的最大容量
    var capacity: Int
    /// 自己实现双向链表来存 最近访问
    /// 虚拟头节点
    let first = CacheNode()
    /// 虚拟尾结点
    var last = CacheNode()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        first.next = last
        last.prev = first
    }
    
    /// 访问某块key的Cache
    func get(_ key: Int) -> Int {
//        return map[key] ?? -1
        guard let node = map[key] else {
            return -1
        }
        
        removeNode(node)
        addAfterFirst(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            // put的新节点存在 更新value
            node.value = value
            removeNode(node)
            addAfterFirst(node)
            map[key] = node
        } else { // 添加一对新的 key-value
            // 判断 Cahce是否已经存满
            let node = CacheNode(key: key, value: value)
            if map.count == capacity {
                // 淘汰最近最少使用的cache
                if let node = map.removeValue(forKey: last.prev!.key) {
                    removeNode(node)
                }
            }
            //
            map[key] = node
            addAfterFirst(node)
        }
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

// 设计和构建一个“最近最少使用”缓存
// 该缓存会删除最近最少使用的项目。缓存应该从键映射到值(允许你插入和检索特定键对应的值)，并在初始化时指定最大容量。当缓存被填满时，它应该删除最近最少使用的项目。
//
//它应该支持以下操作： 获取数据 get 和 写入数据 put 。
//
//获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
//写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。
//
//示例:
//
//LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );
//
//cache.put(1, 1);
//cache.put(2, 2);
//cache.get(1);       // 返回  1
//cache.put(3, 3);    // 该操作会使得密钥 2 作废
//cache.get(2);       // 返回 -1 (未找到)
//cache.put(4, 4);    // 该操作会使得密钥 1 作废
//cache.get(1);       // 返回 -1 (未找到)
//cache.get(3);       // 返回  3
//cache.get(4);       // 返回  4
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/lru-cache-lcci
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
