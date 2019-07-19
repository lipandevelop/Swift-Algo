//
//  GetVowelAndConsonants.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func getVowelAndConsonants1(_ input: String) -> (vowels: Int, consonants: Int) {
    
    let vowels: String = "aeiou"
    let consonants: String = "bcdfghjklmnpqrstvwxyz"
    
    let lowerCasedInput = input.lowercased()
    _ = lowerCasedInput.filter { $0 >= "a" && $0 >= "z"}
    let vowelStr = lowerCasedInput.filter { vowels.contains($0) }
    let consonatnStr = lowerCasedInput.filter { consonants.contains($0) }
    
    
    return (vowels: vowelStr.count, consonants: consonatnStr.count)
}

func getVowelAndConsonants2(_ input: String) -> (vowels: Int, consonants: Int) {
    
    let vowels = CharacterSet(charactersIn: "aeiou")
    let consonants = CharacterSet(charactersIn: "bcdfghjklmnpqrstvwxyz")
    
    var vowelCount: Int = 0
    var consonantCount: Int = 0
    
    for char in input {
        
        let charStr = String(char)
        
        if charStr.rangeOfCharacter(from: vowels) != nil {
            vowelCount += 1
        }
            
        else if charStr.rangeOfCharacter(from: consonants) != nil {
            consonantCount += 1
        }
    }
    
    return (vowels: vowelCount, consonants: consonantCount)
    
}

//Two more solutions uses .contains method on string, or .contains method on array after input is converted into an array


//let test1 = "Swift Coding Challenges"
//let test2 = "Mississippi"
//
//print(getVowelAndConsonants1(test1))
