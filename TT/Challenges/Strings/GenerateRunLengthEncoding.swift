//
//  GenerateRunLengthEncoding.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

//works, no hint
func generateRunLengthEncoding1(_ input: String) -> String {
    
    var outputValue: String = ""
    
    guard !input.isEmpty else {return outputValue}
    
    var currentChar: Character = input.first!
    var charCount: Int = 0
    outputValue += String(currentChar)
    
    for char in input {
        if char == currentChar {
            charCount += 1
        }
            
        else {
            currentChar = char
            outputValue += String(charCount)
            outputValue += String(currentChar)
            charCount = 1
            
        }
    }
    
    outputValue += String(charCount)
    
    return outputValue
}

//Tutorial brute force solution
func generateRunLengthEncoding2(_ input: String) -> String {
    
    var currentChar: Character?
    var returnValue: String = ""
    var charCount: Int = 0
    
    for letter in input {
        if letter == currentChar {
            charCount += 1
        }
            
        else {
            if let current = currentChar {
                returnValue.append(current)
                returnValue.append(String(charCount))
            }
            
            currentChar = letter
            charCount = 1
        }
    }
    
    if let current = currentChar {
        returnValue.append(current)
        returnValue.append(String(charCount))
    }
    
    return returnValue
}

//Tutorial look ahead solution

func generateRunLengthEncoding3(_ input: String) -> String {
    
    var returnValue: String = ""
    var charCount: Int = 0
    var charArray: [Character] = Array(input)
    
    for index in 0..<charArray.count{
        
        let nextIndex = index + 1
        charCount += 1
        
        if nextIndex == charArray.count || charArray[index] != charArray[nextIndex] {
            returnValue.append(charArray[index])
            returnValue.append(String(charCount))
            charCount = 0
        }
    }
    return returnValue
}


//let test1 = "aabbcc"
//let test2 = "aaabaaabaaa"
//let test3 = "aaAAaa"
//
//generateRunLengthEncoding3(test1)
