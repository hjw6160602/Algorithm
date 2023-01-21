//
//  main.cpp
//  ListNode
//
//  Created by saidicaprio on 2018/12/25.
//  Copyright © 2018 贺嘉炜. All rights reserved.
//

#include <stdio.h>

//    定义链表中的节点
struct Node {
    int value;                //    节点中的成员
    Node *pNext;        //    指向下一个节点的指针
};

//    创建链表函数
Node* CreateList()  {
    int i;                                            //    用于下面循环
    Node *pHead, *pTail;
    pHead = pTail = new Node();        //  分配一个不存放有效数据的头结点
    
    pTail->pNext = NULL;                            //    最后一个节点的指针置为空
    //    printf("请输入节点个数：");
    //    scanf("%d",&len);
    int len = 100;
    for(i = 0; i < len; i++) {
        //        printf("第 %d 个节点的数值：",i+1);
        //        scanf("%d",&val);
        int val = 100 + i;
        Node *pNew = new Node();    //    为节点分配空间
        pNew->value = val;                            //将用户输入的数据赋给节点的成员
        pTail->pNext = pNew;                        //将最后一个节点的指针指向下一个新的节点
        pNew->pNext = NULL;                            //将新节点中的指针置为空
        pTail = pNew;                                //将新节点赋给最后的一个节点
    }
    return pHead;                                    //返回头节点
}

//    遍历链表函数
void TraverseList(Node *pHead) {
    Node *p = pHead->pNext;                            //将头节点的指针给予临时节点p
    while(NULL != p) {
        printf("%d -> ",p->value);
        p = p->pNext;
    }
    printf("\n");
    return ;
}

void AddToTail(Node **pHead, int value) {
    Node *pNew = new Node();
    pNew->value = value;
    pNew->pNext = NULL;
    if(*pHead == NULL) {
        pHead = &pNew;
    } else {
        Node *pNode = *pHead;
        while(pNode->pNext != NULL) {
            pNode = pNode->pNext;
        }
        pNode->pNext = pNew;
    }
}

int main(int argc, const char * argv[]) {
    Node *pHead = CreateList();
    AddToTail(&pHead, 200);
    TraverseList(pHead);
    return 0;
}
