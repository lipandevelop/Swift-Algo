//
//  WrapArray.swift
//  TT
//
//  Created by Li Pan on 2019-03-09.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func wrappArray(_ element: String, in array: [String]) -> [String]? {
    
    if let index = array.index(where: {return $0 == element}) {
        let secondHalf = array.prefix(upTo: index)
        let firstHalf = array.suffix(from: index)
        
        return Array(firstHalf) + Array(secondHalf)
    }
    
    else {
        
        print("element not in array")
        return array
    }
}

//WrapArray Test
//        print(wrappArray("d", in: ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"]))
