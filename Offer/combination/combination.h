//
//  combination.h
//  combination
//
//  Created by saidicaprio on 2019/1/10.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

#ifndef combination_h
#define combination_h

#include <stdio.h>

#define N  4

/**
 * 组合
 * @param deep 递归深度
 * @param n 数组最大长度
 * @param m 要查找的组合的长度
 */
void comb(int deep, int n, int m);

void display(int arr[], int m);
#endif /* combination_h */
