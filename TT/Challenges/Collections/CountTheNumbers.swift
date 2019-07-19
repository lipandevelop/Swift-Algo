//
//  CountTheNumbers.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element == Int {
    
    func countCharacter(_ target: Character) -> Int {
        
        var total = 0
        
        //loop over every element
        for item in self {
            let str = String(item)
            
            //loop over every letter in string
            for letter in str {
                if letter == target {
                    total += 1
                }
            }
        }
        return total
    }
    
    func countCharacterB(_ target: Character) -> Int {
        
        return self.reduce(0) { $0 + String($1).filter {$0 == target}.count }
        
    }
}
