//
//  Stack.swift
//  TT
//
//  Created by Li Pan on 2019-03-09.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

class StackNode<Value> {
    
    var top: Node<Value>?
    
    func push (_ value: Value) {
        let currentTop = top
        top = Node(value: value, next: currentTop)
    }
    
    func pop (_ value: Value) -> Value? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    func peek () -> Value? {
        return top?.value 
    }
    
}

public struct StackElement<Element> {
    
    private var storage: [Element] = []
    
    public init (_ elements: [Element]) {
        storage = elements
    }
    
    public init (arrayLiteral elements: Element...) {
        storage = elements
    }
    
    public mutating func push (_ element: Element) {
        storage.append(element)
    }
    
    public mutating func pop () -> Element? {
        return storage.popLast()
    }
    
    public mutating func peek() -> Element? {
        return storage.last
    }
}

extension StackElement: CustomStringConvertible {
    
    public var description: String {
        
        let topDivider = "---top---\n"
        let bottomDivider = "\n--------------"
        
        let stackElements = storage
            
            .map { "\($0)"}
            .reversed()
            .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}
