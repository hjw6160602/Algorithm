//
//  main.c
//  RangeSumOfBST
//
//  Created by saidicaprio on 2019/1/14.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

#include "RangeSumOfBST.h"

struct TreeNode *generateBST(int *arr, int length) {
    struct TreeNode *root = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->val = arr[0];
    
    int index = 1;
    struct TreeNode *pCurNode = root;
//    struct TreeNode *pPreNode = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    while (index < length) {
        struct TreeNode *pNode = (struct TreeNode *)malloc(sizeof(struct TreeNode));
        if (arr[index] < pCurNode->val) {
            pNode->val = arr[index];
            pCurNode->left = pNode;
        } else {
            pCurNode = pNode;
            pNode->val = arr[index];
            pCurNode->right = pNode;
        }
        index++;
    }
    return root;
}

int main(int argc, const char * argv[]) {
    int arr[] = {10, 5, 15, 3, 7, 18};
    int length = sizeof(arr) / sizeof(int);
    struct TreeNode *root = generateBST(arr, length);
//    int sum = rangeSumBST(root, 7, 15);
//    printf("%d", sum);
    return 0;
}
