//
//  QuickSort.swift
//  TT
//
//  Created by Li Pan on 2019-03-21.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// Time: Best: Ω(n log(n)) Average: Θ(n log(n)) Worst: O(n^2)
// Space: O(log(n))

// MARK : Naive

func quicksortNaive(_ num: [Int]) -> [Int] {
    guard num.count > 1 else {
        return num
    }
    let pivot = num[num.count / 2]
    let less = num.filter { $0 < pivot }
    let equal = num.filter { $0 == pivot }
    let greater = num.filter { $0 > pivot }
    
    return quicksortNaive(less) + equal + quicksortNaive(greater)
}

// MARK : Lomuto

func partitionLomuto(_ num: inout [Int], low: Int, high: Int) -> Int {
    
    let pivot = num[high]
    var i = low
    for j in low..<high {
        if num[j] <= pivot {
            num.swapAt(i, j)
            i += 1
        }
    }
    num.swapAt(i, high)
    return i
}

func quicksortLomuto(_ num: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let pivot = partitionLomuto(&num, low: low, high: high)
        quicksortLomuto(&num, low: low, high: pivot - 1)
        quicksortLomuto(&num, low: pivot + 1, high: high)
    }
}

// MARK : Median

func medianOfThree(_ num: inout [Int], low: Int, high: Int) -> Int {
    
    let center = (low + high) / 2
    if num[low] > num[center] {
        num.swapAt(low, center)
    }
    if num[low] > num[high] {
        num.swapAt(low, high)
    }
    if num[center] > num[high] {
        num.swapAt(center, high)
    }
    return center
}

func quickSortMedian(_ num: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let pivotIndex = medianOfThree(&num, low: low, high: high)
        num.swapAt(pivotIndex, high)
        let pivot = partitionLomuto(&num, low: low, high: high)
        quicksortLomuto(&num, low: low, high: pivot - 1)
        quicksortLomuto(&num, low: pivot + 1, high: high)
    }
}

// MARK : Hoare

func partitionHoare(_ num: inout [Int], low: Int, high: Int) -> Int {
    
    let pivot = num[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while num[j] > pivot
        repeat { i += 1 } while num[i] < pivot
        
        if i < j {
            num.swapAt(i, j)
        } else {
            return j
        }
    }
}

func quicksortHoare(_ num: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let p = partitionHoare(&num, low: low, high: high)
        quicksortHoare(&num, low: low, high: p)
        quicksortHoare(&num, low: p + 1, high: high)
    }
}

// MARK : DutchFlag

public func partitionDutchFlag(_ num: inout [Int], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) {
    
    let pivot = num[pivotIndex]
    var smaller = low
    var equal = low
    var larger = high
    
    while equal <= larger {
        if num[equal] < pivot {
            num.swapAt(smaller, equal)
            smaller += 1
            equal += 1
        } else if num[equal] == pivot {
            equal += 1
        } else {
            num.swapAt(equal, larger)
            larger -= 1
        }
    }
    return (smaller, larger)
}

public func quicksortDutchFlag(_ num: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let (middleFirst, middleLast) = partitionDutchFlag(&num, low: low, high: high, pivotIndex: high)
        quicksortDutchFlag(&num, low: low, high: middleFirst - 1)
        quicksortDutchFlag(&num, low: middleLast + 1, high: high)
    }
}
