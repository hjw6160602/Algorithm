/*
 * @lc app=leetcode.cn id=380 lang=swift
 *
 * [380] O(1) 时间插入、删除和获取随机元素
 */

// @lc code=start

class RandomizedSet {
    private var nums:[Int]
    private var map:[Int:Int]
    
    init() {
        nums = [Int]()
        map = [Int:Int]()
    }
    
    func insert(_ val: Int) -> Bool {
        if map[val] != nil { return false }
        map[val] = nums.count
        nums.append(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        if map[val] == nil {return false}
        let index = map[val]!
        let last = nums.last!
        // 交换当前位置和数组的最后一个位置
        nums[index] = last
        nums.removeLast()
        map[last] = index
        map[val] = nil
        return true
    }
    
    func getRandom() -> Int {
        return nums[Int.random(in:0..<nums.count)]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
// @lc code=end

