//
//  LRUCache.c
//  LRUCache
//
//  Created by saidicaprio on 2019/1/18.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

#include "LRUCache.h"

LRU Cache
Least recently used

@interface LRUCache
@property(nonatomic, strong) Cache *cache;
@property(nonatomic, strong) Node  *pNode;
@end

@implementation LURCache

@end

typedef Node struct  {
    pValue *Cache;
    pNext *Node;
}

- (void)runLRUCache {
    pHead *Node = (struct Node*)malloc(sizeof())
    while (Cache.Visit) {
        
    }
}

- (void)insertLRUCache(Cache *cache) {
    pNode *preNode = cache.pPreCache;
    Node *pNewCache = (struct Node*)malloc(sizeof(struct Node*));
    pNewCache->pValue = cache;
    pNewCache->pNext = NULL;
}

- (void)deleteLRUCache(pHead *Node, Cache *cache) {
    if(pHead == NULL) {
        return;
    }
    Node *pNode = pHead;
    
    if(pNode == NULL) {
        return;
    }
    Node *pNextNode = pNode->pNext;
    pHead->pNext = pNextNode;
    free(pNode)
}

- (void)findLRUCache(pHead *Node, Cache *cache) {
    if(pHead == NULL) {
        return;
    }
    while(pNode->pNext != NULL) {
        Node *pPreNode = pNode;
        pNode = pNode->pNext;
        if(pNode->pValue == cache) {
            pPreNode->Next = pNode->pNext;
            insertLRUCache(pHead, pNode.pValue);
        }
    }
}


NSDictionary<LRUCache *> *dict;


Cache *cache = Visit();
dict[key] = cache;

