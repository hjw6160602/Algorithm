
class Solution {
    private int[] row = {-1,1,0,0};
    private int[] col = {0,0,-1,1};

    public int longestIncreasingPath(int[][] matrix) {
        if(matrix.length ==0 || matrix[0].length == 0)
            return 0;
        boolean[][] visited = new boolean[matrix.length][matrix[0].length];
        int[][] len = new int[matrix.length][matrix[0].length];
        int max = 0;

        for(int i = 0; i < matrix.length;i++){
            for(int j = 0;j < matrix[0].length;j++){
                max = Math.max(max, find(matrix,visited,len,i,j));
            }
        }
        return max;
    }

    private int find(int[][] matrix,boolean[][] visited,int[][] len,int x,int y){
        // if visited then return the length of this coordinate‘s longest path
        if(visited[x][y])
            return len[x][y];
        len[x][y] = 1;
        for(int i = 0; i < 4;i++) {
            int curX = x + row[i];
            int curY = y + col[i];
            if(curX >=0 && curX < matrix.length && 
               curY >=0 && curY<matrix[0].length && 
               matrix[curX][curY] < matrix[x][y]) {
                //不越界的判断
                len[x][y] = Math.max(len[x][y],find(matrix,visited,len,curX,curY) + 1);
            }
        }
        visited[x][y] = true;
        return len[x][y];
    }
}

public class LongestIncreasingPath {
    public static void main(String []agrs) {
        int[][] matrix = {{9,9,4}, {6,6,8}, {2,1,1}};
        // int m = matrix.length;
        // int n = matrix[0].length;
        Solution solution = new Solution();
        int len = solution.longestIncreasingPath(matrix);
        System.out.println(len);
    }
}