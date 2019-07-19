//
//  Fibonacci.swift
//  TT
//
//  Created by Li Pan on 2019-02-27.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation


//Mark: fibonacci dynamic programing - Iteration (Best solution)
// O(n) time

func fibBottomUp(_ n: Int) -> Int {
    
    guard n > 1 else {return 1}
    guard n != 0 else { return 0 }
    
    var hashMap: [Int: Int] = [0:1, 1:1]
    
    for i in (2...n) {
        let first = hashMap[i - 1]!
        let second = hashMap[i - 2]!
        
        hashMap[i] = first + second
    }
    
    return hashMap[n]!
}

//Mark: fibonacci dynamic programing - Memoization

func fibMemo(_ n: Int) -> Int {
    
    var memo: [Int : Int] = [:]
    
    func fib(_ n: Int) -> Int {
        
        guard n > 1 else {return 1}
        
        if let cachedValue = memo[n] {
            
            return cachedValue
        }
            
        else {
            
            let result = fib(n - 1) + fib(n - 2)
            memo[n] = result
            return result
        }
    }
    
    return fib(n)
}

//Mark: fibonacci sequence - Iteration

func fibSequence(steps: Int) -> [Int] {
    
    var sequence = [0, 1]
    guard steps > 1 else {return sequence}
    
    for _ in 1..<steps {
        let first = sequence[sequence.count - 2]
        let second = sequence.last!
        sequence.append(first + second)
    }
    sequence.removeFirst()
    return sequence
}

func fibRecursiveSequence(steps: Int) -> [Int] {
    
    func fibRecurseive(steps: Int, first: Int, second: Int) -> [Int] {
        guard steps > 1 else { return [] }
        return [first + second] + fibRecurseive(steps: steps - 1, first: second, second: first + second)
    }
    
    return [1] + fibRecurseive(steps: steps, first: 0, second: 1)
}


//Fibonacci Test
//        for i in 0 ... 91 {
//            print("\(i):", fibBottomUp(i))
//            print("\(i):", fibMemo(i))
//        }

//FibonacciSequence
//        print(fibRecursiveSequence(steps: 20))
