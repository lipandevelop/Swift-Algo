//
//  FindLongestPrefix.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//My method after 2 hints
func findLongestPrefix1(_ input: String) -> String{
    
    guard !input.isEmpty else {fatalError("String cannot be empty")}
    
    let words = input.components(separatedBy: .whitespacesAndNewlines)
    print(words)
    
    var currentPrefix: String = ""
    var bestPrefix: String = ""
    
    for char in input {
        
        let letters = currentPrefix + String(char)
        
        for word in words {
            if (word.range(of: letters) == nil) {
                return bestPrefix
            }
            bestPrefix = currentPrefix
            currentPrefix = letters
            print(letters)
        }
    }
    
    return bestPrefix
}

//Tutorial solution
func findLongestPrefix2(_ input: String) -> String{
    let parts = input.components(separatedBy: .whitespaces)
    
    guard let first = parts.first else {return ""}
    
    var currentPrefix: String = ""
    var bestPrefix: String = ""
    
    for letter in first {
        
        currentPrefix += String(letter)
        
        for word in parts {
            
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }
        bestPrefix = currentPrefix
    }
    
    return bestPrefix
}



//let test1 = "swift switch swill swim"
//let test2 = "flip flap flop"
//
//findLongestPrefix2(test1)

