//
//  BubbleSort.c
//  BubbleSort
//
//  Created by saidicaprio on 2018/12/26.
//  Copyright © 2018 saidicaprio. All rights reserved.
//

#include "BubbleSort.h"

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void BubbleSort(int arr[], int len) {
    for (int i = 0; i < len - 1; i++) {
        for (int j = 0; j < len - 1 - i; j++) {
            if (arr[j] > arr[j+1]) {
                swap(&arr[j], &arr[j+1]);
            }
        }
    }
}
