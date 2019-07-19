//
//  RemoveDuplicates.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//Using NSOrderedSet
func removeDuplicate1(_ input: String) -> String {
    
    let array = Array(input).map { String ($0) }
    let orderedSet = NSOrderedSet(array: array)
    let letters = Array(orderedSet) as! Array<String>
    
    return letters.joined()
}

//Brute force method
func removeDuplicate2(_ input: String) -> String {
    
    var usedArray: [Character] = []
    
    for char in input {
        if !usedArray.contains(char) {
            usedArray.append(char)
        }
    }
    
    return String(usedArray)
}

//KV method 3X slower than brute force method
func removeDuplicate3(_ input: String) -> String {
    
    var usedDict: [Character : Bool] = [:]
    
    let result = Array(input).filter {
        usedDict.updateValue(true, forKey: $0) == nil
    }
    
    return String(result)
}


//let test1 = "wombat"
//let test2 = "hello"
//let test3 = "mississipi"
//
//removeDuplicate3(test1)
