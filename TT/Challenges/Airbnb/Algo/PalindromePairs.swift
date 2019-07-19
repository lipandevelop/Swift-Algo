//
//  PalindromePairs.swift
//  TT
//
//  Created by Li Pan on 2019-03-23.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func palindromePair(_ words: [String]) -> [[Int]] {
    
    var outputArray: [[Int]] = []
    guard words.count > 2 else { return  outputArray }
    
    var hashMap = [String : Int]()
    var hashSet = Set<Pair>()
    
    for (index, word) in words.enumerated() {
        
        let reversedWord = word
        
        hashMap[String(reversedWord.reversed())] = index
        
    }
    
    for (i, word) in words.enumerated() {

        for j in 0 ... word.count {
            
            let range = String.Index(encodedOffset: j)
            
            let left = String(word[..<range])
            let right = String(word[range...])
            
            print(hashMap)
            print("left:", left)
            print("right:", right)
            
            if isPalindrom(left), let rightKey = hashMap[right], rightKey != i {
                
                let rightPair = Pair(left: rightKey, right: i)
                
                if !hashSet.contains(rightPair) {
                    hashSet.insert(rightPair)
                    outputArray.append([i, rightKey])
                }
            }
            
            if isPalindrom(right), let leftKey = hashMap[left], leftKey != i {
                
                let leftPair = Pair(left: i, right: leftKey)
                
                if !hashSet.contains(leftPair) {
                    hashSet.insert(leftPair)
                    outputArray.append([leftKey, i])
                }
            }
        }
    }
    
    return outputArray
}

private struct Pair: Hashable {
    let left: Int
    let right: Int
    
    init (left: Int, right: Int) {
        self.left = left
        self.right = right
    }
}
