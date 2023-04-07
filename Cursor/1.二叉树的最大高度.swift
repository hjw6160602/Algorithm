// 定义树节点
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    var stack: [(TreeNode, Int)] = [(root, 1)]
    var maxDepth = 0
    while !stack.isEmpty {
        let (node, depth) = stack.removeLast()
        maxDepth = max(maxDepth, depth)
        if let left = node.left {
            stack.append((left, depth + 1))
        }
        if let right = node.right {
            stack.append((right, depth + 1))
        }
    }
    return maxDepth
}