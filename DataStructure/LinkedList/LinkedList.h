//
//  LinkedList.h
//  LinkedList
//
//  Created by 贺嘉炜 on 2018/12/25.
//  Copyright © 2018年 贺嘉炜. All rights reserved.
//

#ifndef LinkedList_h
#define LinkedList_h

#include  <stdbool.h>

// 定义链表中的节点
struct Node {
    int value;           // 节点中的成员
    struct Node *pNext;  // 指向下一个节点的指针
};

// 函数声明
/** 创建链表函数 */
struct Node* CreateList(void);
/** 遍历链表函数 */
void TraverseList(struct Node*);
/**
 * 链表节点插入函数
 * param1 是头节点
 * param2 要在第几个节点前插入
 * param3 是要插入的数据
 */
bool InsertNode(struct Node*, int, int);
/** 在链表尾部插入节点 */
void AddToTail(struct Node**, int);
/** 删除某个链表中的节点 */
void DeleteNode(struct Node**, struct Node*);
/** 查找链表中的倒数第K个节点 */
struct Node* FindKthToTail(struct Node*, unsigned int);
/** 反转链表 */
struct Node* ReverseList(struct Node*);
/** 倒序打印链表 */
void PrintListReversingly_Recursively(struct Node*);


#endif /* LinkedList_h */
