//
//  BinaryTree.swift
//  TT
//
//  Created by Li Pan on 2019-03-09.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

class BinaryTreeNode {
    let value: Int
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    var operation: OperationTypes?
    
    init(value: Int, leftChild: BinaryTreeNode?, rightChild: BinaryTreeNode?, operation: OperationTypes? = nil) {
        
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.operation = operation
        
    }
}

func binaryTreeSearch(node: BinaryTreeNode?, key: Int) -> Bool {
    
    if node == nil {
        
        return false
    }
    
    if node?.value == key {
        return true
    }
        
    else if key < node!.value {
        
        return binaryTreeSearch(node: node?.leftChild, key: key)
        
    }
        
    else {
        
        return binaryTreeSearch(node: node?.rightChild, key: key)
    }
}

//        //BianrySearchTree Test
//
////                10
////               /  \
////              5   14
////             /    / \
////            1    11 20
//
//        //left branch
//        let oneNode = BinaryTreeNode(value: 1, leftChild: nil, rightChild: nil)
//        let fiveNode = BinaryTreeNode(value: 5, leftChild: oneNode, rightChild: nil)
//
//        //right branch
//        let elevenNode = BinaryTreeNode(value: 11, leftChild: nil, rightChild: nil)
//        let twentyNode = BinaryTreeNode(value: 20, leftChild: nil, rightChild: nil)
//        let fourteenNode = BinaryTreeNode(value: 14, leftChild: elevenNode, rightChild: twentyNode)
//
//        let tenRootNode = BinaryTreeNode(value: 10, leftChild: fiveNode, rightChild: fourteenNode)
//
//        print(binaryTreeSearch(node: tenRootNode, key: 12))
