//
//  Math.swift
//  TT
//
//  Created by Li Pan on 2019-03-23.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//Sum of 1 to N = (n+1) * n/2
//Sum of GP = 2⁰ + 2¹ + 2² + 2³ + … 2^n = 2^(n+1)-1
//Permutations of N = N! / (N-K)!
//Combinations of N = N! / (K! * (N-K)!)

func sumOfOne(to n: Double) -> Double {
    
    return (n + 1) * n/2
}

func sumOfGP(n: Int) -> Double {
    
    var outPut: Double = 0
    
    for i in 0..<n {
        outPut += pow(2, Double(i))
    }
    
    return outPut - 1
}

func permutationOf(n: Double, k: Double) -> Double {
    
    return factorial(n) / factorial((n - k))
}

func combinationOf(n: Double, k: Double) -> Double {
    
    return factorial(n) / (factorial(k) * factorial(( n - k)))
}
