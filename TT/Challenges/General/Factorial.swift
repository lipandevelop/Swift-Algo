//
//  Factorial.swift
//  TT
//
//  Created by Li Pan on 2019-03-03.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//O(n)
func factorial(of key: UInt) -> UInt {
    
    guard key != 0 else {return 1}
    
    return key * factorial(of: key - 1)
}

func factorial(_ key: Double) -> Double {
    
    var mult = key
    var retVal: Double = 1.0
    while mult > 0.0 {
        retVal *= mult
        mult -= 1.0
    }
    return retVal
}

//Factoiral
//        for i in 0...50 {
//            print("\(i):", factorial(of: UInt(i)))
//        }
