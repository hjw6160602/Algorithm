//
//  37. 解数独.swift
//  Search
//
//  Created by 贺嘉炜 on 2023/4/25.
//  Copyright © 2023 saidicaprio. All rights reserved.
//

import Foundation

func test37solveSudoku() {
    let board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
    var charBoard = board.map { $0.map { Character($0) } }
    LeetCode.solveSudoku(&charBoard)
    print(charBoard)
}

//40 ms 42.11%
//14.2 MB 68.42%
extension Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        _ = backtrack(&board, 0, 0)
    }

    private func backtrack(_ board: inout [[Character]],  _ i: Int, _ j: Int) -> Bool {
        let m = 9, n = 9
        if j == n {
             // 找到一个可行解，触发 base case
            return backtrack(&board, i + 1, 0)
        }
        if i == m {
            // 找到一个可行解，触发 base case
            return true
        }
        if board[i][j] != "." {
            // 如果有预设数字，不用我们穷举
            return backtrack(&board, i, j + 1)
        }
        for num in 1...9 {
            let ch = Character(String(num))
            // 如果遇到不合法的数字，就跳过
            if !isValid(board, i, j, ch) {
                continue
            }
            board[i][j] = ch
            // 如果找到一个可行解，立即结束
            if backtrack(&board, i, j + 1) {
                return true
            }
            board[i][j] = "."
        }
        // 穷举完 1~9，依然没有找到可行解，此路不通
        return false
    }

    // 通过传入num来在board中检验是否合法
    private func isValid(_ board: [[Character]],
                         _ r: Int,
                         _ c: Int,
                         _ n: Character) -> Bool  {
        for i in 0..<9 {
            if board[r][i] == n {
                return false
            }
            if board[i][c] == n {
                return false
            }
            // 判断 3 x 3 方框是否存在重复
            if (board[(r/3)*3 + i/3][(c/3)*3 + i%3] == n) {
                return false
            }
        }
        return true
    }
}
