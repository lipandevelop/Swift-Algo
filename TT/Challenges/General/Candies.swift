//
//  Candies.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//You have a even numbered list of candies, you need to give exactly half to your brother, but need to retain the maximum amount of variety

func candyTypes (_ candies : [Int]) -> Int {
    let half = candies.count / 2
    let uniqueCandies = Set(candies)
    print(uniqueCandies)

    if half > uniqueCandies.count {
        return uniqueCandies.count
    }

    else {
        return half
    }
}

//Test Candies
//candyTypes([3, 4, 7, 7, 6, 6])
