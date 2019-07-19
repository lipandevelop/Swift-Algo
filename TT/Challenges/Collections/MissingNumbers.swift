//
//  MissingNumbersIn.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element == Int {
    
    //Naive O(n)
    func findMissingNumbers(from elements: [Int]) -> [Int] {
        
        let set = Set(self)
        var missingElements: [Int] = []
        
        for element in self {
            
            // set.contain is O(1)
            if !set.contains(element) {
                missingElements.append(element)
            }
        }
        return missingElements
    }
    
    func findMissingNumbersSubtracting(from elements: [Int]) -> [Int] {
        
        let fullSet = Set(self)
        let subSet = Set(elements)
        
        // O(1)? if sorting not needed
        return Array(fullSet.subtracting(subSet))

//        // up to O(log n)
//        return Array(fullSet.subtracting(subSet).sorted())
    }
}

//FindMissingNumbersInArray Test

//        let findMissingNumbersArray = Array(1...100)
//        var findMissingNumbersMissingNumbersArray = Array(1...100)
//        findMissingNumbersMissingNumbersArray.remove(at: 5)
//        findMissingNumbersMissingNumbersArray.remove(at: 8)
//        findMissingNumbersMissingNumbersArray.remove(at: 13)
//        findMissingNumbersMissingNumbersArray.remove(at: 21)
//
//        print(findMissingNumbersArray.findMissingNumbersSubtracting(from: findMissingNumbersMissingNumbersArray))
