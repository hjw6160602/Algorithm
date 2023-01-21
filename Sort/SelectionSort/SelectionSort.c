//
//  SelectionSort.c
//  SelectionSort
//
//  Created by saidicaprio on 2018/12/26.
//  Copyright © 2018 saidicaprio. All rights reserved.
//

#include "SelectionSort.h"

void swap (int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void SelectionSort(int arr[], int len) {
    for (int i = 0; i < len - 1; i ++) {
        int min = i;
        for (int j = i + 1; j < len; j++) {
            if (arr[j] < arr [min]) {
                min = j;
            }
        }
        swap(&arr[i], &arr[min]);
    }
}

void SelectionSort2(int arr[], int len) {
    for (int i = 0; i < len - 1; i++){
        for (int j = i + 1; j < len; j++){
            if (arr[i] > arr[j]) {
                swap(&arr[i], &arr[j]);
            }
        }
    }
}
