//
//  HasThreeDifferentLetters.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// My method 2, works
func hasThreeDifferentLetters2(_ input1: String, and input2: String) -> Bool{
    guard input1.count == input2.count else {return false}
    let input2Array = Array(input2)
    var differentLetterCount: Int = 0
    
    for (index, char) in input1.enumerated() {
        if char != input2Array[index] {
            differentLetterCount += 1
            //            print("match: \(differentLetterCount): \(char)")
            if differentLetterCount > 3 {
                return false
            }
        }
    }
    
    return true
    
}

//let test1 = ("Clamp", "Cramp")
//let test2 = ("Clamp", "Crams")
//let test3 = ("Clamp", "Grams")
//let test4 = ("Clamp", "Grans")
//let test5 = ("Clamp", "Clam")
//let test6 = ("clamp", "maple")
//
//hasThreeDifferentLetters2(test1.0, and: test1.1)
//hasThreeDifferentLetters2(test2.0, and: test2.1)
//hasThreeDifferentLetters2(test3.0, and: test3.1)
//hasThreeDifferentLetters2(test4.0, and: test4.1)
//hasThreeDifferentLetters2(test5.0, and: test5.1)
//hasThreeDifferentLetters2(test6.0, and: test6.1)
