//
//  Node.swift
//  TT
//
//  Created by Li Pan on 2019-03-05.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {return "\(value)"}
        
        return "\(value) -> " + String(describing: next) + " "
    }
}
