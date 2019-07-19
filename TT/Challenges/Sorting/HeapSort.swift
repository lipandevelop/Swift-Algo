//
//  HeapSort.swift
//  TT
//
//  Created by Li Pan on 2019-03-21.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// Time: Best: Ω(n log(n)) Average: Θ(n log(n)) Worst: O(n log(n))
// Space: O(1)

extension Heap {
    
    func sorted() -> [Element] {
        var heap = Heap(sort: sort, elements: elements)
        for index in heap.elements.indices.reversed() {
            heap.elements.swapAt(0, index)
            heap.siftDown(from: 0, upTo: index)
        }
        return heap.elements
    }
}

/* Heap Sort Test */
//        let heap = Heap(sort: >, elements: [6, 12, 2, 26, 8, 18, 21, 9, 5])
//        print(heap.sorted())


//    Set<String> f1 = new HashSet<>(Arrays.asList("A", "B", "E", "F"));
//    Set<String> f2 = new HashSet<>(Arrays.asList("A", "B", "D", "G"));
//    Set<String> f3 = new HashSet<>(Arrays.asList("X", "B", "A", "D", "Q"));
//    Set<String> f4 = new HashSet<>(Arrays.asList("A", "B", "C", "D", "P", "Q"));
//    Set<String> f5 = new HashSet<>(Arrays.asList("A", "X", "Y", "Z"));
