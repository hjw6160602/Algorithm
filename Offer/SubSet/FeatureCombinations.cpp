//
//  FeatureCombinations.cpp
//  SubSet
//
//  Created by saidicaprio on 2019/1/10.
//  Copyright © 2019 saidicaprio. All rights reserved.
//

#include "FeatureCombinations.hpp"

void displayVector(vector<string> vec) {
    // 使用迭代器 iterator 访问值
    vector<string>::iterator v = vec.begin();
    while( v != vec.end()) {
        if (*v != "") {
            cout << "[" << *v << "], ";
        }
        v++;
    }
    cout << endl;
}

vector<vector<string>> FindAllCombnations(vector<string> arr) {
    vector<vector<string>> feature_combinations;
    int n = sizeof(arr) / sizeof(int);
    // 从1个元素的开始找，找到n个元素的为止
    for (int i = 0; i < n; i++) {
        int num = i + 1;
        cout << num <<"个元素的情况: "<<endl;
        for (int j = 0; j < num; j++) {
            vector<string> combination;
            
            for (int k = 0; k < n; k++) {
                combination.push_back(arr[k]);
            }
            displayVector(combination);
//            feature_combinations.push_back(combination);
        }
    }
    return feature_combinations;
}

