//
//  Graph.swift
//  TT
//
//  Created by Li Pan on 2019-03-12.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

public enum EdgeType {
    case directed
    case undirected
}

public struct Vertex<T> {
    public var index: Int
    public var data: T
}

public struct Edge<T> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}


public protocol Graph {
    
    associatedtype Element
    
    func createVertex(data: Element) -> Vertex<Element>
    
    func addDirection(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirection(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    
    func edge(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
    
    public var description: String {
        return "\(index), \(data)"
    }
}

public class AdjacencyList<T: Hashable>: Graph {
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    
    public init () {}
    
    public func createVertex(data: T) -> Vertex<T> {
        
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
        
    }
    
    public func addDirection(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    public func addUndirection(between source: Vertex<T>, and destination: Vertex<T>, weight: Double?) {
        
        addDirection(from: source, to: destination, weight: weight)
        addDirection(from: destination, to: source, weight: weight)
    }
    
    public func add(_ edge: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        
        switch edge {
            
        case .directed:
            addDirection(from: source, to: destination, weight: weight)
            
        case .undirected:
            addUndirection(between: source, and: destination, weight: weight)
        }
    }
    
    public func edge(from source: Vertex<T>) -> [Edge<T>] {
        
        return adjacencies[source] ?? []
    }
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        
        return edge(from: source)
            .first { $0.destination == destination }?
            .weight
    }
    
}

extension AdjacencyList: CustomStringConvertible {
    
    public var description: String {
        
        var result = ""
        
        for (vertex, edges) in adjacencies {
            
            var edgeString = ""
            
            for (index, edge) in edges.enumerated() {
                
                if index != edges.count - 1 {
                    
                    edgeString.append("\(edge.destination), ")
                    
                } else {
                    
                    edgeString.append("\(edge.destination)")
                }
            }
            
            result.append("\(vertex) ---> [ \(edgeString) ]\n")
            
        }
        
        return result
    }
}
