//
//  FindMedian.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element == Int {
    
    func findMedian() -> Double? {
        
        guard !self.isEmpty else {return nil}
        
        let sortedSelf = self.sorted()
        let middleIndex = sortedSelf.count/2
        
        if sortedSelf.count % 2 == 0 {
            let uppperBound = middleIndex
            let lowerBound = uppperBound - 1
            return Double(sortedSelf[uppperBound] + sortedSelf[lowerBound])/2
        }
        
        else {
            //swift rounds down when dividing an odd number by two
            return Double(sortedSelf[middleIndex])
        }
    }
}

//FindMedian Test

//        let findMediaArray = [1, 2, 3, 4, 5]
//        print(findMediaArray.findMedian())

//ReImplementIndexOf
//        let indexOfArray = ["0", "1", "2", "3", "4", "5"]
//        print(indexOfArray.indexOf(of: "5"))

//IteratingLinkedList

//        let iteratingStr = "abcdefghijklmnopqrstuvwxyz"
//        var iteratingLinkedList = LinkedList<Character>()
//        for char in iteratingStr.reversed() {
//            iteratingLinkedList.push(char)
//        }
//
//        print(iteratingLinkedList)



