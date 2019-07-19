//
//  MergSort.swift
//  TT
//
//  Created by Li Pan on 2019-03-03.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// Time: Best: Ω(n log(n)) Average: Θ(n log(n)) Worst: O(n^2)
// Space: O(n)

func mergeSort(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else {return array}
    
    let left = Array(array[0..<array.count/2])
    let right = Array(array[array.count/2..<array.count])
    
    return merge(left: mergeSort(left), right: mergeSort(right))
}

private func merge(left: [Int], right: [Int]) -> [Int]{
    
    var mergedArray: [Int] = []
    
    var left = left
    var right = right
    
    while !left.isEmpty && !right.isEmpty {
        
        if left.first! < right.first! {
            mergedArray.append(left.removeFirst())
        }
            
        else {
            mergedArray.append(right.removeFirst())
        }
    }
    
    return mergedArray + left + right
}

func mergeSort2<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    
    guard array.count > 1 else { return array }
    
    let middle = array.count / 2
    let left = mergeSort2(Array(array[..<middle]))
    let right = mergeSort2(Array(array[middle...]))
    
    return merge2(left, right)
}

private func merge2<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
    
    var leftIndex = 0
    var rightIndex = 0
    var result: [Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
            
        }
        
        else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        }
        
        else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
        
    }
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}

//MergeSort Test
//        print(mergeSort(createRandomArray(upperBound: 1000)))
