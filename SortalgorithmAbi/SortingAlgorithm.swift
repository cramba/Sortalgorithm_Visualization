//
//  SortingAlgorithm.swift
//  SortalgorithmAbi
//
//  Created by Marc Bachmann on 02.07.18.
//  Copyright © 2018 Marc Bachmann. All rights reserved.
//

import Cocoa

class SortingAlgorithm: NSObject {
    var values: [Int] = []
    
    init(_ values: [Int]) {
        self.values = values
    }
    
    func insertSort() -> [Int] {
        var sortArray: [Int] = self.values
        var hole = 0
        var value = 0
        
        for i in 1...sortArray.count - 1 {
            value = sortArray[i]
            hole = i
            while hole > 0 && sortArray[hole - 1] > value {
                sortArray[hole] = sortArray[hole - 1]
                hole = hole - 1
            }
            sortArray[hole] = value
        }
        return sortArray
    }
    
    /*func insertSort(_ graphView: Sortgraph!) {
     var sortArray: [Int] = self.values
     var hole = 0
     var value = 0
     
     for i in 1...sortArray.count - 1 {
     usleep(1000)
     value = sortArray[i]
     hole = i
     while hole > 0 && sortArray[hole - 1] > value {
     sortArray[hole] = sortArray[hole - 1]
     hole = hole - 1
     }
     sortArray[hole] = value
     graphView.values = sortArray
     
     }
     //return sortArray
     
     }*/
    
    func bubbleSort() -> [Int] {
        var sortArray: [Int] = self.values
        //var temp = 0
        for k in 1...sortArray.count - 1 {
            for  i in 0..<sortArray.count - k {
                if sortArray[i] > sortArray[i + 1] {
                    sortArray.swapAt(i, i + 1)
                }
            }
            
        }
        return sortArray
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
            //Sortierung herstellen
            if left.first! < right.first! {
                mergedArray.append(left.removeFirst())
            } else {
                mergedArray.append(right.removeFirst())
            }
        }
        
        return mergedArray + left + right
    }
}



