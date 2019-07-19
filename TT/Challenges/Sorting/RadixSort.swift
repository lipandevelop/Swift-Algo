//
//  RadixSort.swift
//  TT
//
//  Created by Li Pan on 2019-03-21.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// Time: Best: Ω(n+k) Average: Θ(n+k) Worst: O(n^2)
// Space: O(n)

func radixSort(_ array: inout [Int]) {
    
    let base = 10
    var done = false
    var digits = 1
    
    while !done {
        
        done = true
        
        var buckets: [[Int]] = .init(repeating: [], count: base)
        
        array.forEach {
            number in
            let remainingPart = number / digits
            let digit = remainingPart % base
            buckets[digit].append(number)
            if remainingPart > 0 {
                done = false
            }
        }
        
        digits *= base
        array = buckets.flatMap { $0 }
    }
}
