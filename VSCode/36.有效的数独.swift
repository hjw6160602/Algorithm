/*
 * @lc app=leetcode.cn id=36 lang=swift
 *
 * [36] 有效的数独
 */

// @lc code=start

// 64 ms 100%
// 14.1 MB 60.46%
class Solution {
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

class ValidSudoku {
    func isValidSudoku(_ board: [[Character]]) -> Bool {          
        let len = 9
        
        var rowSet = Array(repeating: Set<Character>(), count: len)
        var colSet = Array(repeating: Set<Character>(), count: len)
        var boxSet = Array(repeating: Set<Character>(), count: len)
        
        for i in 0..<len {    
            for j in 0..<len {
                let currentChar = board[i][j]
                
                if currentChar == "." {
                    continue
                }
                
                // check row
                if !isValid(&rowSet[i], currentChar) {
                    return false 
                }
                
                // check column
                if !isValid(&colSet[j], currentChar) {
                    return false 
                }
                
                // check sub-box
                let idx = 3 * (i / 3) + j / 3
                if !isValid(&boxSet[idx], currentChar) {
                    return false 
                }
            }
        }
        
        return true
    }
    
    private func isValid(_ set: inout Set<Character>, _ char: Character) -> Bool {
        if set.contains(char) {
            return false
        } else {
            set.insert(char)
            return true
        }
    }
}
// @lc code=end

