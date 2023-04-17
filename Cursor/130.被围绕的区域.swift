
func solve(_ board: inout [[Character]]) {
    let m = board.count
    let n = board[0].count
    
    // 定义方向数组
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    // 定义 DFS 函数
    func dfs(_ x: Int, _ y: Int) {
        board[x][y] = "#"
        for i in 0..<4 {
            let mx = x + dx[i]
            let my = y + dy[i]
            if mx >= 0 && mx < m && my >= 0 && my < n && board[mx][my] == "O" {
                dfs(mx, my)
            }
        }
    }
    
    // 遍历边缘的 O，将与其相连的 O 标记为 #
    for i in 0..<m {
        for j in 0..<n {
            if (i == 0 || i == m - 1 || j == 0 || j == n - 1) && board[i][j] == "O" {
                dfs(i, j)
            }
        }
    }
    
    // 将剩余的 O 修改为 X，将 # 修改为 O
    for i in 0..<m {
        for j in 0..<n {
            if board[i][j] == "O" {
                board[i][j] = "X"
            } else if board[i][j] == "#" {
                board[i][j] = "O"
            }
        }
    }
}
``` 

This is a Swift solution to the problem of finding all regions surrounded by 'X' in a given matrix and replacing all 'O's in those regions with 'X's. 

The solution uses a DFS algorithm to traverse the matrix and mark all 'O's that are connected to the boundary 'O's with a special character '#'. Then it iterates through the matrix again and replaces all remaining 'O's with 'X's and all '#'s with 'O's. 

The time complexity of this solution is O(mn), where m and n are the dimensions of the matrix.