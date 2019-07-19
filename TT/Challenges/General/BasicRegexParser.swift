//
//  BasicRegexParser.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

/*
 
 Implement a regular expression function isMatch that supports the '.' and '*' symbols. The function receives two strings - text and pattern - and should return true if the text matches the pattern as a regular expression. For simplicity, assume that the actual symbols '.' and '*' do not appear in the text string and are used as special symbols only in the pattern string.
 
 In case you aren’t familiar with regular expressions, the function determines if the text and pattern are the equal, where the '.' is treated as a single a character wildcard (see third example), and '*' is matched for a zero or more sequence of the previous letter (see fourth and fifth examples).
 
 input:  text = "aa", pattern = "a"
 output: false
 
 input:  text = "aa", pattern = "aa"
 output: true
 
 input:  text = "abc", pattern = "a.c"
 output: true
 
 input:  text = "abbb", pattern = "ab*"
 output: true
 
 input:  text = "acd", pattern = "ab*c."
 output: true
 
 */

func isRegexMatch(text: String, pattern: String) -> Bool {
    
    let text = Array(text)
    let pattern = Array(pattern)
    
    return isMatchHelper(text, pattern, 0, 0)
    
}

fileprivate func isMatchHelper(_ text: [Character], _ pattern: [Character], _ textIndex: Int, _ patternIndex: Int) -> Bool{
    
    // either of the indices reaches the end

    if textIndex >= text.count {
        
        if patternIndex >= pattern.count {
            return true
        }
            
        else {
            
            if (patternIndex + 1 < pattern.count) && (pattern[patternIndex + 1] == "*") {
                
                return isMatchHelper(text, pattern, textIndex, patternIndex + 2)
                
            }
            else {
                
                return false
            }
        }
    }
        
    else if (patternIndex >= pattern.count) && (textIndex < text.count) {
        
        return false
    }
        
    // if char is followed by '*'

    else if (patternIndex + 1 < pattern.count) && (pattern[patternIndex + 1] == "*") {
        
        if (pattern[patternIndex] == ".") || (text[textIndex] == pattern[patternIndex]) {
            return isMatchHelper(text, pattern, textIndex, patternIndex + 2) || isMatchHelper(text, pattern, textIndex + 1, patternIndex)
        }
            
        else {
            return isMatchHelper(text, pattern, textIndex, patternIndex + 2)
        }
    }
        
    // if char is '.' or ordinary char.

    else if (pattern[patternIndex] == ".") || (pattern[patternIndex] == text[textIndex]) {
        return isMatchHelper(text, pattern, textIndex + 1, patternIndex + 1)
    }
        
    else {
        return false
    }
}


