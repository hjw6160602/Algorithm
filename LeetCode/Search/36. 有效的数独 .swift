//
//  36. 有效的数独 .swift
//  Search
//
//  Created by 贺嘉炜 on 2023/4/25.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func test36solveSudoku() {
    let board = [["5","3",".",".","7",".",".",".","."]
                 ,["6",".",".","1","9","5",".",".","."]
                 ,[".","9","8",".",".",".",".","6","."]
                 ,["8",".",".",".","6",".",".",".","3"]
                 ,["4",".",".","8",".","3",".",".","1"]
                 ,["7",".",".",".","2",".",".",".","6"]
                 ,[".","6",".",".",".",".","2","8","."]
                 ,[".",".",".","4","1","9",".",".","5"]
                 ,[".",".",".",".","8",".",".","7","9"]]
    let charBoard = board.map { $0.map { Character($0) } }
    let x = LeetCode.isValidSudoku(charBoard)
    print(x)
}

extension Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
         for i in 0..<9 {
             for j in 0..<9 {
                let n = board[i][j]
                if n == "." {
                    continue
                }
                if !isValid(board, i, j, n) {
                    return false
                }
             }
         }
         return true
    }

    // 通过传入n来在board中检验是否合法
    private func isValid(_ board: [[Character]],
                         _ r: Int,
                         _ c: Int,
                         _ n: Character) -> Bool  {
        for i in 0..<9 {
            if i != c && board[r][i] == n  {
                return false
            }
            if i != r && board[i][c] == n {
                return false
            }
        }
        // 检验一个3x3方阵当中是否有重复
        for x in (r / 3 * 3)..<(r / 3 * 3 + 3) {
            for y in (c / 3 * 3)..<(c / 3 * 3 + 3) {
                if x != r && y != c && board[x][y] == n {
                    return false
                }
            }
        }
        return true
    }
}
