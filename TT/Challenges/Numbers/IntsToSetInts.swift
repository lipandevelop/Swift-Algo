//
//  IntsToSetInts.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// Take this array of Ints and create a set of Ints but keep the order in tact

func intsToSetInts(array: [Int]) -> [Int] {
    var intSet: [Int] = []
    var intDict: [Int: Bool] = [:]
    
    for int in array {
        if intDict[int] == nil {
            intSet.append(int)
            intDict[int] = true
        }
    }
    
    return intSet
}

//Test
//intsToSetInts(array: [4,2,2,9,0,2,1])
