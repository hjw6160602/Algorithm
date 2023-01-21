//
//  SubSet.c
//  SubSet
//
//  Created by saidicaprio on 2019/1/9.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

#include "SubSet.h"
//#include <>

#define MAX_N 5

int g_arr[MAX_N] = {0};
int g_cnt = 0;

int Recur(int* arr, int arr_size, int req_cnt) {
    if (req_cnt > 0) {
        //数据没有选够，从剩下的数据中继续选
        //先选中最小的
        arr[0] = 1;
        //然后从剩下的arr_size - 1个数据中选req_cnt-1个数据
        Recur(arr+1, arr_size - 1, req_cnt-1);
        //回溯一下，跳过刚才选的那个最小数的情况
        arr[0] = 0;
        if (arr_size > req_cnt) {
            Recur(arr+1, arr_size - 1, req_cnt);
        }
    } else {
        //找到一组完整数据
        ++g_cnt;
        //输出组合
        for(int i = 0; i < arr_size; i++) {
            printf("%d\t", arr[i]);
//            if (arr[i] == 1) {
//                printf("%d", i);
//            }
        }
        printf("\n");
    }
    return g_cnt;
}

int count = 0;
int Recuresive(int *arr, int n, int k) {
    if (k > n) {
        return count;
    }
    Recuresive(arr, n-1, k-1);
    
    return count;
}


void FindAllCombnations(int *arr) {
    int length = sizeof(arr) / sizeof(int);
     Recuresive(arr, length, length);
    for (int i = 0; i < length; i++) {
        printf("%d", arr[i]);
        int num = i + 1;
        for (int j = 0; j < num; j++) {
            
            for (int k = 0; k < length; k++) {
                
            }
        }
    }
}

//1. features = ['ip', 'device_id', 'user_agent', 'phone_name' ....]
//feature_combination = [
//                       ['ip'],
//                       ['ip', 'device_id'],
//                       ['device_id', 'user_agent', 'phone_name'],
//                       ....
//                       ]
//
//Cn1 + Cn2 + ... Cnn = 2^n - 1
//
//['ip'], ['device_id'], ['ip', 'device_id']
//['ip'], ['device_id'], ['user_agent'], ['ip', 'device_id'], ['ip', 'user_agent'], ['device_id', 'device_id'], ['ip', 'device_id', 'user_agent']
//
//1 -> 1
//2 -> 3
//3 -> 7
//
//N-1 -> M
//N -> 2M + 1
//
//findAllFeatureCombination(features)
//
//-(NSArray *)FindAllFeatureCombination(NSArray<NSString *> *features) {
//    NSArray <NSSet *>*combinations;
//    NSInteger length = [features length];
//    if (!length) {
//        return nil;
//    }
//
//    for (NSInteger index1 = 0; index1 < length-4; index1++) {
//        NSSet<String *>combination;
//        [combinations addObject combination];
//        [combination addObject features[index1]];
//        for(NSInteger index2 = index1+1; index 2 < 4; index2++) {
//            [combination addObject features[index2]];
//            [combinations addObject combination];
//        }
//    }
//
//    for(NSInteger i=0; i<length; i++) {
//
//    }
//    return combinations;
//}
//
//combination            combinations
//['ip', 'device_id'] -> [['ip', 'device_id'],['ip', 'device_id', 'user_agent']]
//['ip', 'device_id', 'user_agent']
