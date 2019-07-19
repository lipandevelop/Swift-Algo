//
//  IsPangram.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func isPangram1(_ input: String) -> Bool{
    
    let lowerCaseInput = input.lowercased()
    let array = Array(lowerCaseInput).map { String($0) }
    _ = array.filter { $0 >= "a" && $0 <= "z" }
    let orderedSet = NSOrderedSet(array: array)
    let lettersWithSpace = Array(orderedSet) as! Array<String>
    
    print(lettersWithSpace.count)
    print(lettersWithSpace)
    return lettersWithSpace.count == 27
    
}

// .characters is deprecated, but making it into an array an then filtering with alphabets regex does not take away the whitespace.

//func isPangram2(_ input: String) -> Bool{
//
//        let set = Set(input.lowercased().characters)
//        let letters = set.filter { $0 >= "a" && $0 <= "z" }
//        print(letters)
//        print(letters.count)
//        return letters.count == 26
//
//}

//let test1 = "The quick brown fox jumps over the lazy dog" //true
//let test2 = "The quick brown fox jumped over the lazy dog" //false

//isPangram1(test1)
//isPangram2(test2)
