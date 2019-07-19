//
//  IsPrime.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

extension Int {
    
    func isPrime() -> Bool {
        
        guard self >= 2 else { return false }
        guard self != 2 else { return true }
        
        let largestDivisor = Int(ceil(sqrt(Double(self))))
        for i in 2 ... largestDivisor {
            if self % i == 0 {
                return false
            }
        }
        
        return true
    }
}

//Test
//for (count, i) in (2 ... 1000).enumerated() {
//    if i.isPrime() {
//        previousNum = i - previousNum
//        print("\(count + 1): \(i) distance: \(previousNum)")
//    }
//}
