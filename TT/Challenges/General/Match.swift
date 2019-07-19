//
//  Match.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

/*
 A string of brackets is considered correctly matched if every opening bracket in the string can be paired up with a later closing bracket, and vice versa. For instance, “(())()” is correctly matched, whereas “)(“ and “((” aren’t. For instance, “((” could become correctly matched by adding two closing brackets at the end, so you’d return 2.
 
 Given a string that consists of brackets, write a function bracketMatch that takes a bracket string as an input and returns the minimum number of brackets you’d need to add to the input in order to make it correctly matched.
 
 Explain the correctness of your code, and analyze its time and space complexities.
 
 input:  text = “(()”
 output: 1
 
 input:  text = “(())”
 output: 0
 
 input:  text = “())(”
 output: 2
 */

func bracketMatch(text: String) -> Int {
    
    if text.count == 1 {
        return 1
    }
    
    //())(
    var opened: Bool = false
    var difference: Int = 0
    let text = Array(text)
    
    for b in text {
        
        if b == "(" {
            difference += 1
            opened = true
        }
        
        if b == ")" {
            if difference == 0 || !opened {
                difference += 1
                opened = false
            }
                
            else {
                difference -= 1
            }
        }
    }
    
    return difference
    
}

/*
 function bracketMatch(text):
 diffCounter = 0
 ans = 0
 n = text.length
 
 for i from 0 to n-1:
 if ( text[i] == '(' ):
 diffCounter += 1
 else if ( text[i] == ')' ):
 diffCounter -= 1
 if ( diffCounter < 0 ):
 diffCounter += 1
 ans += 1
 
 return ans + diffCounter
 */
