/*
 * @lc app=leetcode.cn id=394 lang=swift
 *
 * [394] 字符串解码
 */

// @lc code=start
class Solution {
    func decodeString(_ s: String) -> String {
        var stack = [(Int, String)]()
        var res = ""
        var muti = 0
        for c in s {
            if c == "[" {
                // 将之前的结果和乘数入栈
                stack.append((muti, res))
                muti = 0
                res = ""
            } else if c == "]" {
                // 将之前的结果和当前的乘数字符结果拼接起来
                if let (curMutil, lastRes) = stack.popLast() {
                    res = lastRes + String(repeating: res, count: curMutil)
                }
            } else if c.isWholeNumber {
                // 每经过一个数字就将其跟上一位数字拼在一起
                muti = muti * 10 + c.wholeNumberValue!
            } else {
                // 正常字符就直接拼接在res里面
                res.append(c)
            }
        }
        return res
    }
}
// @lc code=end

