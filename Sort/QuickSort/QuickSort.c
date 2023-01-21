//
//  QuickSort.c
//  QuickSort
//
//  Created by saidicaprio on 2018/12/26.
//  Copyright © 2018 saidicaprio. All rights reserved.
//


#include "QuickSort.h"

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void quick_sort_recursive (int arr[], int start, int end) {
    if (start >= end) {
        return;
    }
    int mid = arr[end];
    int left = start;
    int right = end - 1;

    while (left < right) {
        while (arr[left] < mid && left < right )
            left++;
        while (arr[right] >= mid && left < right )
            //right++
            right--;
        swap(&arr[left], &arr[right]);
    }
    if (arr[left] >= arr[end]) {
        swap(&arr[left], &arr[end]);
    } else {
        left++;
    }

    if (left) {
        quick_sort_recursive (arr, start, left - 1);
    }
    // right + 1
    quick_sort_recursive(arr, left + 1, end);
}

void quick_sort(int arr[], int len) {
    quick_sort_recursive(arr, 0, len - 1);
}

