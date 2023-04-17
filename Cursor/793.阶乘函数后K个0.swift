func preimageSizeFZF(_ k: Int) -> Int {
    var left = 0
    var right = Int.max
    while left <= right {
        let mid = left + (right - left) / 2
        let numZeros = countTrailingZeros(mid)
        if numZeros == k {
            return 5
        } else if numZeros < k {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return 0
}

func countTrailingZeros(_ n: Int) -> Int {
    var count = 0
    var num = n
    while num > 0 {
        count += num / 5
        num /= 5
    }
    return count
}