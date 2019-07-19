//
//  ReverseString.swift
//  TT
//
//  Created by Li Pan on 2019-03-26.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation


func reverseString(_ input: String) -> String {
    
    var output = ""
    var str = input
    
    for _ in str {
        
        output += String(str.removeLast())
        
    }
    
    return output
}


//Test
//print(reverseString("hello"))
