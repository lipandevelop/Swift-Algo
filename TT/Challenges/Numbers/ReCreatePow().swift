//
//  ReCreatePow().swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

extension Int {
    func myPow(_ power: Int) -> Int {
        
        guard self >= 0 && power >= 0 else {fatalError("numbers need to be positive")}
        
        var outputValue = self
        for _ in 1..<power {
            outputValue *= self
        }
        
        return outputValue
    }
}

//Tutorial solution
func myPow1(number: Int, toThePowerOf power: Int) -> Int {
    
    guard number >= 0 && power >= 0 else {fatalError("numbers need to be positive")}
    
    var outputValue = number
    
    for _ in 1..<power {
        outputValue *= number
    }
    
    return outputValue
}

//Tutorial recursive solution
func myPow2(number: Int, toThePowerOf power: Int) -> Int {
    
    guard number >= 0 && power >= 0 else {fatalError("numbers need to be positive")}
    
    if power == 1 {return number}
    
    return number * myPow2(number: number, toThePowerOf: power - 1)
}


//test
//2.myPow(48)
//myPow1(number: 2, toThePowerOf: 48)
//myPow2(number: 2, toThePowerOf: 48)
