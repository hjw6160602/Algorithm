//
//  RangeSumOfBST.c
//  RangeSumOfBST
//
//  Created by saidicaprio on 2019/1/14.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

#include "RangeSumOfBST.h"

int rangeSumBST(struct TreeNode* root, int L, int R) {
    if (!root) {
        return 0;
    }
    int sum = 0;
    
    if (root->val == L || root->val == R) {
        sum += root->val;
        return sum;
    } else {
        if (root->val > L) {
            sum += root->val;
            rangeSumBST(root->right, L, R);
        } else {
            sum += root->val;
            rangeSumBST(root->left, L, R);
        }
        if (root->val > R) {
            sum += root->val;
            rangeSumBST(root->right, L, R);
        } else {
            sum += root->val;
            rangeSumBST(root->left, L, R);
        }
    }
    
    return sum;
}
