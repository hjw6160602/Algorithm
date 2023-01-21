//
//  208. 实现 Trie (前缀树).swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2022/8/18.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/implement-trie-prefix-tree

import Foundation


class Trie {
    // 152 ms 97.22%
    // 24.4 MB 36.11%
    var isEnd = false
    var nodes: [Trie?] = Array(repeating: nil, count: 26)
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var trie = self
        for char in word {
            let charAscii = Int(char.asciiValue!) - 97
            if let subTrie = trie.nodes[charAscii] {
                trie = subTrie
            } else {
                let subTrie = Trie()
                trie.nodes[charAscii] = subTrie
                trie = subTrie
            }
        }
        trie.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var trie = self
        for char in word {
            let charAscii = Int(char.asciiValue!) - 97
            guard let subTrie = trie.nodes[charAscii] else {
                return false
            }
            trie = subTrie
        }
        return trie.isEnd;
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var trie = self
        for char in prefix {
            let charAscii = Int(char.asciiValue!) - 97
            guard let subTrie = trie.nodes[charAscii] else {
                return false
            }
            trie = subTrie
        }
        return true
    }
}

//class Trie {
//    private var nodes: [Character: Trie]
//
//    /** Initialize your data structure here. */
//    init() {
//        nodes = [:]
//    }
//
//    /** Inserts a word into the trie. */
//    func insert(_ word: String) {
//        var trie = self
//        for char in word {
//            if let subTrie = trie.nodes[char] {
//                trie = subTrie
//            } else {
//                let subTrie = Trie()
//                trie.nodes[char] = subTrie
//                trie = subTrie
//            }
//        }
//        trie.nodes["#"] = Trie()
//    }
//
//    /** Returns if the word is in the trie. */
//    func search(_ word: String) -> Bool {
//        var trie = self
//        for char in word {
//            guard let subTrie = trie.nodes[char] else {
//                return false
//            }
//            trie = subTrie
//        }
//        return trie.nodes["#"] != nil;
//    }
//
//    /** Returns if there is any word in the trie that starts with the given prefix. */
//    func startsWith(_ prefix: String) -> Bool {
//        var trie = self
//        for char in prefix {
//            guard let subTrie = trie.nodes[char] else {
//                return false
//            }
//            trie = subTrie
//        }
//        return true
//    }
//}

func test208Trie() {
    //输入
    //["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
    //[[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
    //输出
    //[null, null, true, false, true, null, true]
    
    let trie = Trie()
    trie.insert("apple")
    print(trie.search("apple"))  // 返回 True
    print(trie.search("app"))    // 返回 False
    print(trie.startsWith("app"))// 返回 True
    trie.insert("app")
    print(trie.search("app"))    // 返回 True
}

//Trie（发音类似 "try"）或者说 前缀树 是一种树形数据结构，用于高效地存储和检索字符串数据集中的键。
//这一数据结构有相当多的应用情景，例如自动补完和拼写检查。

//请你实现 Trie 类：
//Trie() 初始化前缀树对象。
//func insert(_ word: String) 向前缀树中插入字符串 word 。
//func search(_ word: String) -> Bool如果字符串 word 在前缀树中，返回 true（即，在检索之前已经插入）；否则，返回 false 。
//func startsWith(_ prefix: String) -> Bool如果之前已经插入的字符串 word 的前缀之一为 prefix 返回 true 否则 返回 false

//提示：
//1 <= word.length, prefix.length <= 2000
//word 和 prefix 仅由小写英文字母组成
//insert、search 和 startsWith 调用次数 总计 不超过 3 * 104 次
