//
//  SortStringsByLength.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element == String {
    
    func sortByLength () -> [String] {
        
        return self.sorted { $0.count > $1.count }
    }
    
}

//SortStringByLength Test

//        let sortStringByLengthArray = ["abc", "ab", "a", "abcde", "", "123456"]
//        print(sortStringByLengthArray.sortByLength())


