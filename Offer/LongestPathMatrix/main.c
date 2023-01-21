//
//  main.c
//  LongestPathMatrix
//
//  Created by 贺嘉炜 on 2019/1/27.
//  Copyright © 2019年 saidicaprio. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}

m = 4, n = 3

A->C->F->X
|
W  X  A  Z

C  B  W  S

len = 5


- (NSInteger)findLongestPathRecursive(NSarray <Point>*path, Point currentNode) {
    NString currentStr = Matirc[currentNode];
    BOOL noway;
    if (x + 1 < m) {
        if(Matirc[currentNode.x + 1] > currentStr) {
            return 0;
        }
    }
    
    if(Matirc[currentNode.x + 1] > currentStr && Matirc[currentNode.y + 1] > currentStr) {
        if(x -1 >0 && Matirc[x - 1] > currentStr && y-1 >0 &&  Matirc[y - 1] > currentStr) {
            return 0;
        }
    } else {
        path = [path addObject:currentNode];
        NSInteger len = 0;
        if (![path include:currentNode.x + 1] && x + 1 < m ) {
            NSInteger length = findLongestPathRecursive(path, currentNode.x + 1);
            if (length > len)
                len = length
                }
        if (![path include:currentNode.y + 1] && y + 1 < m) {
            NSInteger length = findLongestPathRecursive(path, currentNode.y + 1)
            if (length > len)
                len = length
                }
        if (![path include:currentNode.x - 1] && x - 1 > 0) {
            NSInteger length = findLongestPathRecursive(path, currentNode.x - 1);
            if (length > len)
                len = length
                }
        if (![path include:currentNode.y - 1] && x - 1 > 0) {
            NSInteger length = findLongestPathRecursive(path, currentNode.y - 1);
            if (length > len)
                len = length
                }
        return len;
    }
}
