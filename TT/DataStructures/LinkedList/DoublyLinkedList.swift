//
//  DoublyLinkedList.swift
//  TT
//
//  Created by Li Pan on 2019-03-25.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

class DoubleLinkedListNode<T> {
    var value: T
    var previous: DoubleLinkedListNode<T>?
    var next: DoubleLinkedListNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class DoubleLinkedList<T> {
    private(set) var count: Int = 0
    private var head: DoubleLinkedListNode<T>?
    private var tail: DoubleLinkedListNode<T>?
    
    func addToHead(payload: T) -> DoubleLinkedListNode<T> {
        // if there are no existing head, make this new node the head and tail
        // otherwise connect the existing head to the new node
        let node: DoubleLinkedListNode<T> = DoubleLinkedListNode(value: payload)
        
        defer {
            head = node
            count += 1
        }
        
        guard let head = head else {
            tail = node
            return node
        }
        
        node.next = head
        head.previous = node
        return node
    }
    
    
    func moveToHead(node: DoubleLinkedListNode<T>) {
        // if this node is already the head, do nothing
        // otherwise connect the previous and next node together, then move it to the head
        guard node !== head else { return }
        
        let previousNode = node.previous
        let nextNode = node.next
        
        previousNode?.next = nextNode
        nextNode?.previous = previousNode
        
        node.previous = nil
        node.next = head
        
        // if we are moving the previous tail to head, must set the new tail to the one before the previous tail
        if node === tail {
            tail = previousNode
        }
        
        head = node
    }
    
    func removeTail() -> DoubleLinkedListNode<T>? {
        guard let tail = tail else { return nil }
        
        let secondLastNode = tail.previous
        secondLastNode?.next = nil
        self.tail = secondLastNode
        
        count -= 1
        
        return tail
    }
}
