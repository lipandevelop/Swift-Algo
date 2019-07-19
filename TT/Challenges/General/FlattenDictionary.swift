//
//  FlattenDictionary.swift
//  TT
//
//  Created by Li Pan on 2019-03-23.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func flattenDictionary(dict: Dictionary<String, Any>) -> Dictionary<String, String> {
    
    var outputDict: [String : String] = [:]
    
    for (key, value) in dict {
        
        if value is String {
            
            outputDict[key] = value as? String
            
        }
            
        else if value is Int {
            
            outputDict[key] = String(value as! Int)
        }
            
        else if value is [String : Any] {
            
            let recursiveDict = flattenDictionary(dict: value as! [String : Any])
            
            for (nestedKey, nestedValue) in recursiveDict {
                
                var newKey: String
                
                if nestedKey.isEmpty {
                    newKey = key
                }
                    
                else if key.isEmpty {
                    newKey = nestedKey
                }
                    
                else {
                    newKey = key + "." + nestedKey
                }
                
                outputDict[newKey] = nestedValue
                
            }
        }
    }
    
    return outputDict
}

// FlattenDictionary Test

//let dict: [String : Any] = [
//    "Key1" : "1",
//    "Key2" : [
//        "a" : "2",
//        "b" : "3",
//        "c" : [
//            "d" : "3",
//            "e" : [
//                "" : "1"
//            ]
//        ]
//    ]
//]

//flattenDictionary(dict: dict)

