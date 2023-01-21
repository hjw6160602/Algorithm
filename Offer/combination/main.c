//
//  main.c
//  combination
//
//  Created by saidicaprio on 2019/1/10.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

#include "combination.h"

int main(int argc, const char * argv[]) {
    // 分别例举出从n个里面跳出1个、2个....n个g的组合情况
    for(int i = 1; i <= N; i++) {
        comb(0, N, i);
    }
    return 0;
}
