//
//  FizzBuzz.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func fizzBuzz1(_ input: Int) -> String{
    
    var outputString: String = "\(input)"
    
    if input % 3 == 0 {
        outputString = "Fizz"
    }
        
    else if input % 5 == 0 {
        outputString = "Buzz"
    }
    
    if input % 3 == 0 && input % 5 == 0{
        outputString = "Fizz Buzz"
    }
    
    return outputString
    
}

func fizzBuzz2() {
    
    for i in 1...100 {
        if i % 3 == 0 {
            if i % 5 == 0 {
                print("Fizz Buzz")
            }
                
            else {
                print("Fizz")
            }
        }
            
        else if i % 5 == 0 {
            print("Buzz")
        }
            
        else {
            print(i)
        }
    }
}

func fizzBuzz3() {
    
    (1...100).forEach { print($0 % 3 == 0 ? $0 % 5 == 0 ? "Fizz Buzz" : "Fizz" : $0 % 5 == 0 ? "Buzz" : "\($0)") }
}
