/*
 * @lc app=leetcode.cn id=37 lang=swift
 *
 * [37] 解数独
 */

// @lc code=start
class Solution {

    // 52 ms 26.32%
    // 14 MB 89.47%
    func solveSudoku(_ board: inout [[Character]]) {
        guard board.count != 0 || board[0].count != 0 else {
            return
        }
        helper(&board)
    }
    
    private func helper(_ board: inout [[Character]]) -> Bool {
        let m = board.count, n = board[0].count
    
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "." {
                    for num in 1...9 {
                        // 去检验当前num是否合法
                        if isValid(board, i, j, Character(String(num))) {
                            board[i][j] = Character(String(num))

                            if helper(&board) {
                                // 做选择
                                return true
                            } else {
                                // 撤销选择
                                board[i][j] = "."
                            }
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    // 通过传入num来在board中检验是否合法
    private func isValid(_ board: [[Character]], 
                         _ i: Int, 
                         _ j: Int, 
                         _ num: Character) -> Bool  {
        let m = board.count, n = board[0].count
        // 检验一行当中是否重复
        for x in 0..<n {
            if board[i][x] == num {
                return false
            }
        }
        // 检验一列当中是否 
        for y in 0..<m {
            if board[y][j] == num {
                return false
            }
        }
        // 检验一个3x3方阵当中是否有重复
        for x in i / 3 * 3..<i / 3 * 3 + 3 {
            for y in j / 3 * 3..<j / 3 * 3 + 3 {
                if board[x][y] == num {
                    return false
                }
            }
        }
        return true
    }
}
// @lc code=end

