//
//  InsertSort.c
//  InsertSort
//
//  Created by saidicaprio on 2018/12/26.
//  Copyright © 2018 saidicaprio. All rights reserved.
//

#include "InsertSort.h"


void InsertSort(int arr[], int len) {
    int j, temp;
    for (int i = 1; i < len; i++) {
        temp = arr[i];
        for (j = i; j > 0 && arr[j-1] > temp; j--)
            arr[j] = arr[j-1];
        arr[j] = temp;
    }
}

//void InsertSort(int a[], int len){
//    int tmp = 0;
//    for (int i = 1; i < len; i++) {
//        int j = i - 1;
//        if (a[i] < a[j]) {
//            tmp = a[i];
//            a[i] = a[j];
//            while (tmp < a[j-1]) {
//                a[j] = a[j-1];
//                j--;
//            }
//            a[j] = tmp;
//        }
//    }
//}
