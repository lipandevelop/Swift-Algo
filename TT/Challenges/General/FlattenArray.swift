//
//  FlattenArray.swift
//  TT
//
//  Created by Li Pan on 2019-03-09.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func flattenArray(_ nestedArray: [Any]) -> [Int] {
    
    var outputArray: [Int] = []
    
    for element in nestedArray {
        
        if element is Int {
            
            outputArray.append(element as! Int)
        }
        
        else if element is [Any] {
            
            print(element)
            
            let recursionResult = flattenArray(element as! [Any])
            
            for num in recursionResult {
                
                outputArray.append(num)
            }
        }
    }
    
    return outputArray
}

//FlattenArray

//        print(flattenArray([1, [2, [3, 4], [5, [6, [7, 8, [9], 10], 11, [12, [13, 14]]], 15]]]))
