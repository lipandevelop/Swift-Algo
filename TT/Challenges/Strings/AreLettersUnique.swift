//
//  AreLettersUnique.swift
//  TT
//
//  Created by Li Pan on 2019-03-24.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

func areLettersUnique(in input: String) -> Bool {
    
    return Set(input).count == input.count
    
}
