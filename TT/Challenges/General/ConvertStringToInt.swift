//
//  ConvertStringToInt.swift
//  TT
//
//  Created by Li Pan on 2019-03-16.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func convertToInt(_ string: String) -> Int {
    
    var total: Int = 0
    var exponent: Int = 0
    var hashMap = [
        "1" as Character : 1,
        "2" : 2,
        "3" : 3,
        "4" : 4,
        "5" : 5,
        "6" : 6,
        "7" : 7,
        "8" : 8,
        "9" : 9,
    ]
    
    for c in string.reversed() {
        
        if let value = hashMap[c] {
            let num = Decimal(value) * pow(10, exponent)
            total += NSDecimalNumber(decimal: num).intValue
            exponent += 1
        }
    }
    
    
    return total
}

//ConvertStringToInt Test
//        print(convertToInt("1a3b3c7d"))
