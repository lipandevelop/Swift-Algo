//
//  CountRepeatingChar.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//Brute force method
func countRepeatingCharacters1(_ input: String, character: Character) -> Int {
    
    var count: Int = 0
    
    for char in input {
        if char == character {
            count += 1
        }
    }
    
    return count
}


//Functional method 0.9X speed of first method
func countRepeatingCharacters2(_ input: String, character: Character) -> Int {
    
    let characters: [Character] = Array(input)
    return characters.reduce(0) {
        $1 == character ? $0 + 1 : $0
    }
    
}

//CountedSet, not efficient 10X slower
func countRepeatingCharacters3(_ input: String, character: Character) -> Int {
    
    let characters = Array(input)
    let array = characters.map { String($0) }
    let countedSet = NSCountedSet(array: array)
    
    return countedSet.count
}

//Most Elegant method
func countRepeatingCharacters4(_ input: String, character: Character) -> Int {
    
    let trimmedString = input.replacingOccurrences(of: String(character), with: "")
    
    return input.count - trimmedString.count
}

//let test1 = ("The rain in Spain", Character("a"))
//let test2 = ("Mississipi", Character("i"))
//let test3 = ("Hacking with Swift", Character("i"))
//
//
//countRepeatingCharacters1(test1.0, character: test1.1)
//countRepeatingCharacters2(test2.0, character: test2.1)
//countRepeatingCharacters2(test3.0, character: test3.1)
//countRepeatingCharacters4(test2.0, character: test2.1)
