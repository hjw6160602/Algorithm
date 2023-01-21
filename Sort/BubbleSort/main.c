//
//  main.c
//  BubbleSort
//
//  Created by saidicaprio on 2018/12/26.
//  Copyright © 2018 saidicaprio. All rights reserved.
//

#include "BubbleSort.h"

void display() {
    int arr[] = { 22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70 };
    int len = sizeof(arr) / sizeof(int);
    BubbleSort(arr, len);
    for (int i = 0; i < len; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
    display();
    return 0;
}
