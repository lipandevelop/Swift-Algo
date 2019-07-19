//
//  BinarySyntaxTree.swift
//  TT
//
//  Created by Li Pan on 2019-03-09.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

enum OperationTypes {
    case add
    case subtract
    case multiply
    case divide
}

class TreeOperationNode {
    let value: Float?
    var leftChild: TreeOperationNode?
    var rightChild: TreeOperationNode?
    var operation: OperationTypes?
    
    init(value: Float?, leftChild: TreeOperationNode?, rightChild: TreeOperationNode?, operation: OperationTypes? = nil) {
        
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.operation = operation
        
    }
}

func evaluate(node: TreeOperationNode) -> Float {
    
    guard node.value == nil else {return node.value!}
    
    if let operation = node.operation {
        
        switch operation {
            
        case .add:
            return evaluate(node: node.leftChild!) + evaluate(node: node.rightChild!)
            
        case .subtract:
            return evaluate(node: node.leftChild!) - evaluate(node: node.rightChild!)
            
        case .multiply:
            return evaluate(node: node.leftChild!) * evaluate(node: node.rightChild!)
            
        case .divide:
            let rightNode = evaluate(node: node.rightChild!)
            if rightNode != 0 {
                return evaluate(node: node.leftChild!) / evaluate(node: node.rightChild!)
            }
            
            else {
                print("number cannot be divided by 0")
                return -1
            }
            
        }
    }
    
    
    return 0
    
}

//BianrySyntaxTree Test

// 5 + 25 * 6
//                +
//               /  \
//              *    5
//             / \
//            25  6

//        let sixNode = TreeOperationNode(value: 6, leftChild: nil, rightChild: nil)
//        let fiveNode = TreeOperationNode(value: 5, leftChild: nil, rightChild: nil)
//        let twentyFiveNode = TreeOperationNode(value: 25, leftChild: nil, rightChild: nil)
//
//
//        let multiply25_6Node = TreeOperationNode(value: nil, leftChild: twentyFiveNode, rightChild: sixNode, operation: .multiply)
//        let rootPlustNode = TreeOperationNode(value: nil, leftChild: multiply25_6Node, rightChild: fiveNode, operation: .add)
//
//        print(evaluate(node: rootPlustNode))



