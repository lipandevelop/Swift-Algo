//
//  StringsContainSameCharacters.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func does(_ input1: String, containTheSameCharactersAs input2: String) -> Bool {
    
    guard !input1.isEmpty && !input2.isEmpty else {
        print("one or both of the input strings are empty")
        return false
    }
    
    return Array(input1).sorted() == Array(input2).sorted()
}

//StringsContainSameCharacters Test

//        let test1 = ("abca", "abca")
//        let test2 = ("abc", "cba")
//        let test3 = ("a1 b2", "b 1 a 2")
//        let test4 = ("abc", "abca")
//        let test5 = ("abc", "Abc")
//        let test6 = ("abc", "cbAa")
//
//        print(does(test1.0, containTheSameCharactersAs: test1.1))
//        print(does(test2.0, containTheSameCharactersAs: test2.1))
//        print(does(test3.0, containTheSameCharactersAs: test3.1))
//        print(does(test4.0, containTheSameCharactersAs: test4.1))
//        print(does(test5.0, containTheSameCharactersAs: test5.1))
//        print(does(test6.0, containTheSameCharactersAs: test6.1))
