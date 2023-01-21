//
//  733. 图像渲染.swift
//  BinaryTree
//
//  Created by SaiDiCaprio on 2022/7/1.
//  Copyright © 2022 saidicaprio. All rights reserved.
//  https://leetcode.cn/problems/flood-fill/

import Foundation

extension Solution {
    
//    40 ms 78.87%
//    13.9 MB 47.89%
//    277 / 277
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var image = image
        if image[sr][sc] != newColor {
            _dfs(&image, sr, sc, image[sr][sc], newColor)
        }
        return image
    }
    
    private func _dfs(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ oldColor: Int, _ newColor: Int) {
        // 越界判断
        guard sr >= 0 && sr < image.count,
              sc >= 0 && sc < image[0].count else {
            return
        }
        
        // 初始值相同再去上色
        guard oldColor == image[sr][sc] else { return }
//        print("当前上色坐标：[\(sr), \(sc)]")
        image[sr][sc] = newColor
        _dfs(&image, sr - 1, sc, oldColor, newColor)
        _dfs(&image, sr + 1, sc, oldColor, newColor)
        _dfs(&image, sr, sc - 1, oldColor, newColor)
        _dfs(&image, sr, sc + 1, oldColor, newColor)
    }
}

func test733FloodFill() {
    
    let image = [[0,0,0],[0,0,0]], sr = 1, sc = 0, newColor = 2
//    let image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, newColor = 0
//    let image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, newColor = 2
    let rendered = LeetCode.floodFill(image, sr, sc, newColor)
    print(rendered)
    
}

//有一幅以 m x n 的二维整数数组表示的图画 image ，其中 image[i][j] 表示该图画的像素值大小。
//
//你也被给予三个整数 sr ,  sc 和 newColor 。你应该从像素 image[sr][sc] 开始对图像进行 上色填充 。
//
//为了完成 上色工作 ，从初始像素开始，记录初始坐标的 上下左右四个方向上 像素值与初始坐标相同的相连像素点，接着再记录这四个方向上符合条件的像素点与他们对应 四个方向上 像素值与初始坐标相同的相连像素点，……，重复该过程。将所有有记录的像素点的颜色值改为 newColor 。
//
//最后返回 经过上色渲染后的图像 。

//示例 1:
//输入: image = [[1,1,1],[1,1,0],[1,0,1]]，sr = 1, sc = 1, newColor = 2
//输出: [[2,2,2],[2,2,0],[2,0,1]]
//解析: 在图像的正中间，(坐标(sr,sc)=(1,1)),在路径上所有符合条件的像素点的颜色都被更改成2。
//注意，右下角的像素没有更改为2，因为它不是在上下左右四个方向上与初始点相连的像素点。

//示例 2:
//输入: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, newColor = 2
//输出: [[2,2,2],[2,2,2]]

//提示:
//m == image.length
//n == image[i].length
//1 <= m, n <= 50
//0 <= image[i][j], newColor < 216
//0 <= sr < m
//0 <= sc < n

