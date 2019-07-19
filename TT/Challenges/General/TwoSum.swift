//
//  TwoSum.swift
//  TT
//
//  Created by Li Pan on 2019-03-03.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// Two Sum
// Given an array of integers, return indices of the two numbers such that they add up to a specific target. You may assume that each input would have exactly one solution, and you may not use the same element twice.

/* TestCases
 
 twoSumNaive([6, 8, 2, 7, 11, 15], target: 9)
 twoSumNaive([6, 8, 2, 7, 11, 15], target: 55)
 
 */

// O(n^2)
func twoSumNaive(_ nums: [Int], target: Int) -> [Int] {
    
    for i in 0...(nums.count - 2) {
        for j in (i + 1)...(nums.count - 1) {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
     
    return []
}

// O(n)
func twoSumHashMap(_ nums: [Int], target: Int) -> [Int] {
    
    var hashmap : [Int : Int] = [:]
    
    for i in 0...(nums.count - 1) {
        hashmap[nums[i]] = i
    }
    
    for j in 0...(nums.count - 1) {
        if let secondIndex = hashmap[target - nums[j]], secondIndex != j {
            return [j, secondIndex]
        }
    }
    
    return []
}

//O(nlogn), O(n) fastest if sorted
func twoSumPointer(_ num: [Int], target: Int) -> [Int] {
    
    var sortedArray = mergeSort(num)
    //O(nlogn)
    var lowIndex: Int = 0
    var highIndex: Int = sortedArray.count - 1
    
    //O(n)
    while lowIndex < highIndex {
        
        let currentSum = sortedArray[lowIndex] + sortedArray[highIndex]
        
        if currentSum > target {
            highIndex -= 1
        }
            
        else if currentSum < target {
            lowIndex += 1
        }
            
        else {
            print("Sum of: \(sortedArray[lowIndex]) + \(sortedArray[highIndex]) = \(target)")
            return [sortedArray[lowIndex], sortedArray[highIndex]]
        }
    }
    print("pointers crossed")
    return []
}

//TwoSum Test
//        print(twoSumPointer([10, 12, 3, 5, 7, 6, 7, 8], sum: 15))

