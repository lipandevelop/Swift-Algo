//
//  ReverseEveryOtherWord.swift
//  TT
//
//  Created by Li Pan on 2019-03-03.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func reverseEveryOtherWord (sentence: String) -> String {
    
    var words = sentence.components(separatedBy: " ").map { $0.removeVowels() }
    
    for (index, word) in words.enumerated() {
        if index % 2 == 1 {
            words[index] = String(word.reversed())
        }
    }
    
    return words.joined(separator: " ")
}

extension String {
    func removeVowels() -> String {
        var newWord = self
        for char in ["a", "e", "i", "o", "u"] {
           newWord = newWord.replacingOccurrences(of: char, with: "")
        }
        
        return newWord
    }
}

//ReverseEveryOtherWord Test
//        print(reverseEveryOtherWord(sentence: "Yo check out this new algorithm where where I reverse every other word!"))
