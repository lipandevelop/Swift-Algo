//
//  ArrayIndex&ElementEquality.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

/*
 Given a sorted array arr of distinct integers, write a function indexEqualsValueSearch that returns the lowest index i for which arr[i] == i. Return -1 if there is no such index. Analyze the time and space complexities of your solution and explain its correctness.
 
 input: arr = [-8,0,2,5]
 output: 2 # since arr[2] == 2
 
 input: arr = [-1,0,3,6]
 output: -1 # since no index in arr satisfies arr[i]
 */

//O(n)
//O(1)
func indexEqualsValueSearchBruteForce(arr: [Int]) -> Int {

    for (i, num) in arr.enumerated() {
        
        if i == num {
            return i
        }
    }
    
    return -1
}

func indexEqualsValueBinarySearch(arr: [Int]) -> Int {
    
    let low = 0
    let high = arr.count - 1
    
    func binarySearch(arr: [Int], low: Int, high: Int) -> Int {
        if high < low {
            return -1
        }
        
        let midIndex = (high - low)/2
        let midValue = arr[midIndex]
        
        if midIndex == midValue && midIndex == 0 || (arr[midIndex - 1] != midIndex - 1) {
            return midIndex
            
        }
            
        else if midIndex > midValue {
            return binarySearch(arr: arr, low: midIndex + 1, high: high)
        }
            
        else {
            return binarySearch(arr: arr, low: low, high: midIndex - 1)
        }
    }
    return binarySearch(arr: arr, low: low, high: high)
}


//O(log n)
//O(1)
func indexEqualsValueSearch(arr: [Int]) -> Int {
    
    var start = 0
    var end = arr.count - 1
    
    while (start <= end) {
        
        let i = (start + end)/2
        
        if (arr[i] - i < 0) {
            start += 1
        }
            
        else if (arr[i] - i == 0) && ((i == 0) || (arr[i-1] - (i-1) < 0)) {
            
            return i
        }
            
        else {
            end -= 1
        }
    }
    
    return -1
}

/*
 The naive solution is to iterate over all the values in the input array and return an index i for which the condition arr[i] == i is met. This takes a linear, O(N), time complexity.
 
 To do better, we should recognize that the sequence of i (array indices) and the sequence of arr[i] (array values) are both strictly monotonically increasing sequences. If we subtract i from both sides of the equation arr[i] = i we get arr[i] - i = 0.
 
 While we can use this to define another array diffArr where diffArr[i] = arr[i] - i and perform a Binary Search for 0 in diffArr, it’s unnecessary. Instead, we can simply modify the binary search condition to arr[i] - i == 0 (instead of the condition diffArr[i] == 0).
 
 So why is it important for the search condition to form a monotonically increasing sequence?
 
 It’s important because otherwise there is no guarantee that the resulting sequence is sorted and binary search works only on sorted sequences. Recall that if an array consists of monotonically increasing values, then it’s sorted by definition (in an ascending order).
 
 To make sure we found the first element that satisfies arr[i] - i == 0, if in the binary search process we find an element that satisfies arr[i] - i == 0, we proceed to check if its the first element in the array, or that the element before it does not satisfy the condition. If not - we continue with the binary search, since this is not the first element that satisfies the condition.
 */

