//
//  Palindrom.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func isPalindrom(_ input: String) -> Bool {
    
    guard !input.isEmpty
        
        else { return true }
    
    let lowerCasedInput = input.lowercased()
    let reversedInput = String(lowerCasedInput.reversed())
//    print(lowerCasedInput)
//    print(reversedInput)
    
    return lowerCasedInput.caseInsensitiveCompare(reversedInput) == .orderedSame
}

//Palindrom Test

//        let test1 = "rotator"
//        let test2 = "Rats live on no evil star"
//        let test3 = "Never odd or even"
//        let test4 = "Hello, world"
//
//        print(isPalindrom(test1))
//        print(isPalindrom(test2))
//        print(isPalindrom(test3))
//        print(isPalindrom(test4))
