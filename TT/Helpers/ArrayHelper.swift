//
//  ArrayHelper.swift
//  TT
//
//  Created by Li Pan on 2019-03-21.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func createRandomArray(upperBound: Int) -> [Int] {
    var outputArray: [Int] = []
    for _ in 0 ..< 50 {
        outputArray.append(Int(arc4random_uniform(UInt32(upperBound))))
    }
    
    return outputArray
}
