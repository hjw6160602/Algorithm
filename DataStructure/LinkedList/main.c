//
//  main.c
//  LinkedList
//
//  Created by 贺嘉炜 on 2018/12/25.
//  Copyright © 2018年 贺嘉炜. All rights reserved.
//

#include <stdio.h>
#include "LinkedList.h"



int main(int argc, const char * argv[]) {
    struct Node* pHead = CreateList();
    AddToTail(&pHead, 200);
    
//    pHead->pNext = NULL;
//    bool succ = InsertNode(pHead, 100, 300);
//    if (succ) {
//        printf("insert succeed!\n");
//    } else {
//        printf("insert failed!\n");
//    }
//    struct Node* pHead2 = ReverseList(pHead);
//    struct Node* pNode = FindKthToTail(pHead, 99);
//    printf("%d \n", pNode->value);
    
//    TraverseList(pHead);
//    TraverseList(pHead2);
    
    PrintListReversingly_Recursively(pHead);
    printf("\n");
    return 0;
}
