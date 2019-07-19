//
//  BinarySearch.swift
//  TT
//
//  Created by Li Pan on 2019-03-03.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func binarySearch(_ key: Int, in array: [Int]) -> Bool {
    
    let sortedArray = array.sorted()
    print(sortedArray)
    
    func search(_ key: Int, in array: [Int]) -> Bool {
        
        guard !array.isEmpty else { return false }
        
        let maxIndex: Int = array.count - 1
        let midIndex: Int = Int(ceil(Double(maxIndex/2)))
        let midValue: Int = array[midIndex]
        
        guard array.first! < key || array.last! > key else {
            print("key value is outside of bounds of the array")
            return false
        }
        
        if array.count == 2 {
            if array.contains(key) {
                return true
            }
                
            else {
                return false
            }
        }
        
        if midValue > key {
            return search(key, in: Array(array[0...midIndex]))
        }
            
        else if midValue < key {
            return search(key, in: Array(array[midIndex...maxIndex]))
        }
            
        else {
            print("key at array \(midIndex): \(midValue) is = to \(key)")
            return true
        }
    }
    
    return search(key, in: sortedArray)

}

//BinarySearch Test
//        print(binarySearch(26, in: createRandomArray(upperBound: 100)))
