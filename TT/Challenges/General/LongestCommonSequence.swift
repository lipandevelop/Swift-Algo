//
//  LongestCommonSequence.swift
//  TT
//
//  Created by Li Pan on 2019-02-27.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// Time and Space: O(2^(m+n))

func lscRecursion(first: String, second: String) -> String{
    
    var callCount = 0
    
    func lsc(s1: [String], s2: [String], i1: Int, i2: Int) -> String {
        
        callCount += 1
        
        if i1 == s1.count || i2 == s2.count {
            return ""
        }
        
        if s1[i1] == s2[i2] {
            let result = s1[i1] + lsc(s1: s1, s2: s2, i1: i1 + 1, i2: i2 + 1)
            return result
            
        }
        
        
        let resultA = lsc(s1: s1, s2: s2, i1: i1 + 1, i2: i2)
        let resultB = lsc(s1: s1, s2: s2, i1: i1, i2: i2 + 1)
        
        print(callCount)
        return resultA.count > resultB.count ? resultA : resultB
        
    }
    
    return lsc(s1: first.map { String ($0) }, s2: second.map { String ($0) }, i1: 0, i2: 0)
}

// Time and Space: O(mn)

func lscMemo(first: String, second: String) -> String {
    
    var memo: [[Int]: String] = [:]
    var callCount = 0
    
    func lsc(s1: [String], s2: [String], i1: Int, i2: Int) -> String {
        
        callCount += 1
        
        //Base case 1: Empty Strings
        if i1 == s1.count || i2 == s2.count {
            return ""
        }
        
        //Base case 2: First letters of strings are equal
        if s1[i1] == s2[i2] {
            let key = [i1, i2]
            if let cachedValue = memo[key] {
                return cachedValue
            }
            
            let result = s1[i1] + lsc(s1: s1, s2: s2, i1: i1 + 1, i2: i2 + 1)
            
            memo[key] = result
            return result
            
        }
        
        //Base case 3: First letters of strings are different
        let keyA = [i1 + 1, i2]
        let keyB = [i1, i2 + 1]
        
        var resultA: String!
        var resultB: String!
        
        if let cachedValueA = memo[keyA] {
            resultA = cachedValueA
        }
            
        else {
            resultA = lsc(s1: s1, s2: s2, i1: i1 + 1, i2: i2)
            memo[keyA] = resultA
            //                print("a:", resultA!)
            
        }
        
        if let cachedValueB = memo[keyB] {
            resultB = cachedValueB
        }
            
        else {
            resultB = lsc(s1: s1, s2: s2, i1: i1, i2: i2 + 1)
            memo[keyB] = resultB
            //                print("b:", resultB!)
        }
        
        return resultA.count > resultB.count ? resultA : resultB
    }
    
    // case-insensitive
    return lsc(s1: first.map { String ($0) }, s2: second.map { String ($0) }, i1: 0, i2: 0)
    
    // case-sensitive
    //        return lsc(s1: first.lowercased().map { String ($0) }, s2: second.lowercased().map { String ($0) }, i1: 0, i2: 0)
    
}

//LongestCommonSequence Test
//        print(lscMemo(first: "oh Hi! i didn't see you there! How are you doing?", second: "Oh hello! I didn't see YOU there! who are you playing?"))
