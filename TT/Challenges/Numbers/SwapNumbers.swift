//
//  SwapNumbers.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func swaping(_ a: Int, with b: Int) -> (a: Int, b: Int) {
    return (a: b, b: a)
}


//My solution with arithmetic
func swapTwoDigitsWithArithmetic(_ input: UInt) -> UInt {
    guard input < 100 else {fatalError("must be two digits")}
    
    let firstComponent: UInt = UInt(Float(input/10).truncatingRemainder(dividingBy: 10))
    let secondComponent: UInt = (input % 10) * 10
    
    return firstComponent + secondComponent
}

//Test
//swaping(5, with: 6)
//swapTwoDigitsWithArithmetic(79)
