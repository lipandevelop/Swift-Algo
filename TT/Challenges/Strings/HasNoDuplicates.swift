//
//  HasNoDuplicates.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func hasNoDuplicates(_ string: String) -> Bool {
    
    let stringOfLetters: Set<Character> = Set(string)
    
    return stringOfLetters.count < string.count
}

//HasNoDuplicates Test

//        let test1 = "No duplicates"
//        let test2 = "abcdefghijklmnopqrstuvwkyz"
//        let test3 = "AaBbCc"
//        let test4 = "Hello, world"
//
//        print(hasNoDuplicates(test1))
//        print(hasNoDuplicates(test2))
//        print(hasNoDuplicates(test3))
//        print(hasNoDuplicates(test4))
