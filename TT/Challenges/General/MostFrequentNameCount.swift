//
//  MostFrequentNameCount.swift
//  TT
//
//  Created by Li Pan on 2019-03-03.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// O(nlogn) time, O(n) space
func mostFrequentNameCount(names: [String]) -> (String, Int) {
    
    var namesDict: [String : Int] = [:]
    
    // O(n)
    for name in names {
        if let count = namesDict[name] {
            namesDict[name] = count + 1
        }
        
        else {
            namesDict[name] = 1
        }
    }
    
    // O(nlogn)
    let array = Array(namesDict.sorted {$0.value > $1.value})
    
    return (array.first!.key, array.first!.value)
}

//MostFrequentNameCount Test
//        print(mostFrequentNameCount(names: ["a", "b", "c", "d", "b", "c", "a", "b", "c", "d", "d", "b", "c", "d", "d"]))
