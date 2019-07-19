//
//  DoesOneStringContainAnother.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

extension String {
    
    func containsString(_ input: String) -> Bool {
        
        return self.lowercased().range(of: input.lowercased()) != nil
        
    }
}

//let test1 = "Hello"
//let test2 = "WORLD"
//let test3 = "Goodbye"
//
//
//"Hello, world".fuzzyContains1(test3)
//"Hello, world".fuzzyContains1(test2)
//"Hello, world".fuzzyContains2(test1)
