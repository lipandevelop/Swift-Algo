//
//  ReverseWordsInString.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func reversWordsInString1(_ input: String) -> String{
    
    let words = input.components(separatedBy: .whitespaces)
    var reversedArray: [String] = []
    
    for word in words {
        reversedArray.append(String(word.reversed() + " "))
    }
    
    return reversedArray.joined()
}

//No loop
func reversWordsInString2(_ input: String) -> String{
    
    let words = input.components(separatedBy: .whitespaces)
    
    return words.map { String($0).reversed() + " " }.joined()
}

//Tutorial solution
func reversWordsInString3(_ input: String) -> String{
    
    let parts = input.components(separatedBy: .whitespaces)
    let reversed = parts.map { String($0).reversed()}
    return String(reversed.joined(separator: " "))
}

//let test1 = "Swift Coding Challenges"
//let test2 = "the quick brown fox"
//
//reversWordsInString3(test2)
