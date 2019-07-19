//
//  ShuffleArray.swift
//  TT
//
//  Created by Li Pan on 2019-03-10.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func shuffleArray <Element> (array: [Element]) -> [Element] {
    
    var shuffleArray = array
    for i in stride(from: array.count - 1, to: 1, by: -1) {
        let random = Int(arc4random_uniform(UInt32(i + 1)))
        if i != random {
            shuffleArray.swapAt(i, random)
        }
    }
    
    return shuffleArray
    
}

//ShuffleArray Test
//        print(shuffleArray(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))


