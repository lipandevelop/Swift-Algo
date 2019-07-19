//
//  StringIsRotated.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func stringIsRotated2(_ input1: String, with input2: String) -> Bool {
    
    guard input1.count == input2.count else { return false }
    
    let expandedInput2 = input2 + input2
    
    return expandedInput2.contains(input1)
    
}


//let test1 = ("abcde", "eabcd")
//let test2 = ("abcde", "cdeab")
//let test3 = ("abcde", "abcde")
//let test4 = ("abc", "a")
//
//stringIsRotated2(test3.0, with: test3.1)

