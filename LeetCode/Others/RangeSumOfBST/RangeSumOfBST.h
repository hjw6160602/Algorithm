//
//  RangeSumOfBST.h
//  RangeSumOfBST
//
//  Created by saidicaprio on 2019/1/14.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

#ifndef RangeSumOfBST_h
#define RangeSumOfBST_h

#include <stdio.h>

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

int rangeSumBST(struct TreeNode* root, int L, int R);

#endif /* RangeSumOfBST_h */
