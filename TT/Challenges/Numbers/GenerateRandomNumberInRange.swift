//
//  GenerateRandomNumberInRange.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//My solution
func generateRandomNumberBetween1(_ min: UInt32, and max: UInt32) {
    
    guard min < max else { fatalError("first number smaller than second") }
    
    print(arc4random_uniform(max) + min)
    
}

//Tutorial solution 1
func generateRandomNumberBetween2(_ min: UInt32, and max: UInt32) {
    
    guard min < max else { fatalError("first number smaller than second") }
    
    print(arc4random_uniform(max - min + 1) + min)
    
}

//Test
//for _ in 1...100 {
//    generateRandomNumberBetween2(1, and: 10)
//}
