//
//  n²Sorts.swift
//  TT
//
//  Created by Li Pan on 2019-03-21.
//  Copyright © 2019 Li Pan. All rights reserved.
//

import Foundation

// MARK: BubbleSort
/* Bubble sort has a best time complexity of O(n) if it’s already sorted, and a worst and average time complexity of O(n²). Traverses front to back, can be applied to all collection types in Swift*/

// Time: Best: Ω(n) Average: Θ(n^2) Worst: O(n^2)
// Space: O(1)

func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    guard array.count > 1 else { return }
    
    for end in (1..<array.count).reversed() {
        var swapped = false
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        if !swapped {
            return
        }
    }
}

func bubbleSort<CollectionType>(_ collection: inout CollectionType) where CollectionType: MutableCollection, CollectionType.Element: Comparable {
    
    guard collection.count > 1 else { return }
    
    for end in collection.indices.reversed() {
        var swapped = false
        var current = collection.startIndex
        while current < end {
            let next = collection.index(after: current)
            if collection[current] > collection[next] {
                collection.swapAt(current, next)
                swapped = true
            }
            current = next
        }
        if !swapped {
            return
        }
    }
}

// MARK: InsertionSort
/* can sort in O(n) time if the collection is already in sorted order and gradually scales down to O(n²) */

// Time: Best: Ω(n) Average: Θ(n^2) Worst: O(n^2)
// Space: O(1)

public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    guard array.count > 1 else { return }
    
    for current in 1..<array.count {
        
        for shifting in (1...current).reversed() {
            
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
}

public func insertionSort<CollectionType>(_ collection: inout CollectionType) where CollectionType: BidirectionalCollection & MutableCollection, CollectionType.Element: Comparable {
    
    guard collection.count > 1 else { return }
    
    for current in collection.indices {
        var shifting = current
        while shifting > collection.startIndex {
            let previous = collection.index(before: shifting)
            if collection[shifting] < collection[previous] {
                collection.swapAt(shifting, previous)
            } else {
                break
            }
            shifting = previous
        }
    }
}

// MARK: SelectionSort
/* Improves upon bubble sort by reducing the number of swapAt operations. Traverses front to back, can be applied to all collection types in Swift */

// Time: Best: Ω(n^2) Average: Θ(n^2) Worst: O(n^2)
// Space: O(1)

public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    guard array.count > 1 else { return }
    
    for current in 0..<(array.count - 1) {
        var lowest = current
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

public func selectionSort<CollectionType>(_ collection: inout CollectionType) where CollectionType: MutableCollection, CollectionType.Element: Comparable {
    
    guard collection.count > 1 else { return }
    
    for current in collection.indices {
        var lowest = current
        var other = collection.index(after: current)
        while other < collection.endIndex {
            if collection[lowest] > collection[other] {
                lowest = other
            }
            other = collection.index(after: other)
        }
        if lowest != current {
            collection.swapAt(lowest, current)
        }
    }
}
