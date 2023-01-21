
public class HelloWorld {
    public static void main(String []agrs) {
        int[][] matrix = {{9,9,4}, {6,6,8}, {2,1,1}};
        int m = matrix.length;
        int n = matrix[0].length;
        Solution solution = new Solution();
        solution.longestIncreasingPath(matrix);
        System.out.println(m);
        System.out.println("Hello World!");
    }
}