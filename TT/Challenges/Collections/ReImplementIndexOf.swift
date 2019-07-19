//
//  ReImplementIndexOf.swift
//  TT
//
//  Created by Li Pan on 2019-03-17.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element: Equatable {
    
    func indexOf(of element: Element) -> Int? {
        
        guard !self.isEmpty else { return nil }
        
        for (index, item) in self.enumerated() {
            
            if item == element {
                return index
            }
        }
        
        return nil
    }
}
