//
//  MergeSortStepByStep.swift
//  SortalgorithmAbi
//
//  Created by Marc Bachmann on 05.07.18.
//  Copyright © 2018 Marc Bachmann. All rights reserved.
//

import Cocoa

class MergeSortStepByStep: NSObject {
    public var values: [Int] {
        get {
            return self.unsortedValues
        }
        set(newValue) {
            self.firstLoop = true
            self.n = newValue.count
            self.swap = true
            self.unsortedValues = newValue
            self.sortingValues = newValue
        }
    }
    var unsortedValues: [Int] = []
    private var sortingValues: [Int] = []
    
    private var firstLoop = true
    private var n = 0
    private var swap = true
    
    init(_ values: [Int]) {
        self.n = values.count
        self.unsortedValues = values
        self.sortingValues = values
    }
    
    
    
    
    
    
    //    split Arrays
    func mergeSort() -> [Int] {
        var sortArray: [Int] = self.values
        
        let leftArray = Array(sortArray[0..<sortArray.count/2])
        let rightArray = Array(sortArray[sortArray.count/2..<sortArray.count])
        
        
        return merge(left: mergeSort(leftArray), right: mergeSort(rightArray))
    }
    
    func mergeSort(_ array: [Int]) -> [Int] {
        
        guard array.count > 1 else {
            return array
        }
        
        let leftArray = Array(array[0..<array.count/2])
        let rightArray = Array(array[array.count/2..<array.count])
        
        
        return merge(left: mergeSort(leftArray), right: mergeSort(rightArray))
    }
    
    //    Merge Arrays
    func merge(left: [Int], right: [Int]) -> [Int] {
        
        var mergedArray: [Int] = []
        var left = left
        var right = right
        
        while left.count > 0 && right.count > 0 {
            
            if left.first! < right.first! {
                mergedArray.append(left.removeFirst())
            } else {
                mergedArray.append(right.removeFirst())
            }
        }
        
        return mergedArray + left + right
    }
    
    
    func stepAhead(_ graphView: Sortgraph) {
        if (self.firstLoop) {
            mergeSort()
            self.firstLoop = false
        } else {
            mergeSort()
        }
        if (self.swap) {
            var localSwapped = false
            for i in 0..<self.n - 1 {
                if (self.sortingValues[i] > self.sortingValues[i + 1]) {
                    self.sortingValues.swapAt(i, i + 1)
                    localSwapped = true
                    //self.swap = true
                }
            }
            self.n -= 1
            if (localSwapped == false) {
                self.swap = false
            }
        }
        
        graphView.values = self.sortingValues
    }
}
