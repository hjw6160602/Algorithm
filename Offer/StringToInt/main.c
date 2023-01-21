//
//  main.c
//  StringToInt
//
//  Created by saidicaprio on 2019/1/9.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

#include "StringToInt.h"

int main(int argc, const char * argv[]) {
    int x = StringToInt("+12345g");
    printf("%d\n", x);
    return 0;
}
