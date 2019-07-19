//
//  FindNSmallest.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element: Comparable {
    
    func findNSmallest(count: Int) -> [Iterator.Element] {
        
        let sorted = self.sorted()
        
        return Array(sorted.prefix(count))
    }
}

//FindNSmallest Test
//        let findNSmallestArray = [1, 2, 3, 4, 5]
//        print(findNSmallestArray.findNSmallest(count: 4))


