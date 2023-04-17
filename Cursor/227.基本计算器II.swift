func calculate(_ s: String) -> Int {
    func helper(_ s: inout Substring) -> Int {
        var stack = [Int]()
        var sign: Character = "+"
        var num = 0
        
        while !s.isEmpty {
            let c = s.removeFirst()
            if c.isNumber {
                num = 10 * num + Int(String(c))!
            }
            // 遇到左括号开始递归计算 num
            if c == "(" {
                num = helper(&s)
            }
            
            if (!c.isNumber && c != " ") || s.isEmpty {
                switch sign {
                case "+":
                    stack.append(num)
                case "-":
                    stack.append(-num)
                case "*":
                    stack[stack.count - 1] *= num
                case "/":
                    stack[stack.count - 1] /= num
                default:
                    break
                }
                num = 0
                sign = c
            }
            // 遇到右括号返回递归结果
            if c == ")" { break }
        }
        return stack.reduce(0, +)
    }
    
    var s = Substring(s)
    return helper(&s)
}
