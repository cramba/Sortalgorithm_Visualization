//
//  InsertSortStepByStep.swift
//  SortalgorithmAbi
//
//  Created by Marc bachmann on 04.07.18.
//  Copyright © 2018 Marc Bachmann. All rights reserved.
//

import Cocoa

class InsertSortStepByStep: NSObject {
    public var values: [Int] {
        get {
            return self.unsortedValues
        }
        set(newValues) {
            self.index = 0
            self.unsortedValues = newValues
            self.sortingValues = newValues
        }
    }
    var unsortedValues: [Int] = []
    private var sortingValues: [Int] = []
    
    private var index = 1
    
    init(_ values: [Int]) {
        self.unsortedValues = values
        self.sortingValues = values
    }
    
    //Sortierschritt ausführen (durch Button getriggert)
    func stepAhead(_ graphView: Sortgraph) {
        if (self.index < self.sortingValues.count) {
            let value = self.sortingValues[self.index]
            var hole = self.index
            while hole > 0 && sortingValues[hole - 1] > value {
                sortingValues[hole] = sortingValues[hole - 1]
                hole -= 1
            }
            sortingValues[hole] = value
            self.index += 1
            
            //Aktuellen Sortierzustand visualisieren
            graphView.values = self.sortingValues
        } else {
            //Fertig Sortierten Zustand visualisieren
            graphView.values = self.sortingValues
        }
    }
}
