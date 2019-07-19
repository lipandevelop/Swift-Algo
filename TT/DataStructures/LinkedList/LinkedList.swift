//
//  LinkedList.swift
//  TT
//
//  Created by Li Pan on 2019-03-05.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init () {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    //Head-first insertion O(1)
    public mutating func push(_ value: Value) {
        
        copyNodes()
        
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head!.next
        }
    }
    
    //Tail-end insertion O(1)
    public mutating func append(_ value: Value) {
        
        copyNodes()

        guard !isEmpty else {
            
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    //GetNode O(i) where i is the given index
    public mutating func node(at index: Int) -> Node<Value> {

        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode!
    }
    
    //Insert O(1)
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        
        copyNodes()
        
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        
        return node.next!
    }
    
    //Pop O(1)
    @discardableResult
    public mutating func pop() -> Value? {
        
        copyNodes()
        
        defer {
            head = head?.next
            
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    //Remove Last O(n)
    @discardableResult
    public mutating func removeLast() -> Value? {
        
        copyNodes()

        
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        
        return current.value
    }
    
    //Remove After O(1)
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        
        copyNodes()

        defer {
            if node.next === tail {
                tail = node
            }
        }
        
        let removedNode = node.next!
        node.next = node.next?.next
        
        return removedNode.value
    }
    
    public mutating func reverseList() -> Node<Value>? {
        
        var current = head
        var previous: Node<Value>?
        var next: Node<Value>?
        
        while current != nil {
            next = current!.next
            current!.next = previous
            previous = current
            
            current = next
            print(previous ?? "finished")

        }
        head = previous
        print("reversed", self)
        return previous
    }
    
    public mutating func reverseListRecursive(head: Node<Value>?) {
        
        guard head != nil else { return }
        
        reverseListRecursive(head: head!.next)
        print(head!.value)
        
    }

}

private extension LinkedList {
    
    // Copy on Write

    mutating func copyNodes () {
        
        guard !isKnownUniquelyReferenced(&head) else { return }
        guard var oldNode = head else { return }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
}

extension LinkedList: Collection {
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        static public func == (lhs: Index, rhs: Index) -> Bool {
            
            switch (lhs.node, rhs.node) {
                
            case let (left?, right?):
                
                return left.next === right.next
                
            case (nil, nil):
                return true
                
            default:
                return false
            }
        }
        
        static public func < (lhs: Index, rhs: Index) -> Bool {
            
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        return position.node!.value
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {return "Empty list"}
        
        return String(describing: head)
    }
}

//        LinkedList Test

//                print("creating, linking, push, append, insert(after:), pop, removeLast, remove(after:) a linked list")

//                var list = LinkedList<Int>()
//
//                list.push(3)
//                list.push(2)
//                list.push(1)
//
//                list.append(8)
//                list.append(9)
//                list.append(10)
//
//                for i in 4 ... 8 {
//                    _ = list.insert(i, after: list.node(at: i-2))
//                }
//
//                list.push(0)
//                list.push(0)
//
//                if !list.isEmpty {
//                    print(list.pop()!)
//                    print(list.removeLast()!)
//                    print(list)
//                    print("Removed node at ", list.remove(after: list.node(at: 8))!)
//                    print(list)
//                    list.reverseList()
//                    print(list)
//                }

//        list.reverseListRecursive(head: list.head)
