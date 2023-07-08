//
//  BubbleSortStepByStep.swift
//  SortalgorithmAbi
//
//  Created by Marc Bachmann on 05.07.18.
//  Copyright © 2018 Marc Bachmann. All rights reserved.
//

import Cocoa

class BubbleSortStepByStep: NSObject {
    public var values: [Int] {
        get {
            return self.unsortedValues
        }
        set(newValue) {
            self.n = newValue.count
            self.swap = true
            self.unsortedValues = newValue
            self.sortingValues = newValue
        }
    }
    var unsortedValues: [Int] = []
    private var sortingValues: [Int] = []
    
    private var n = 0
    private var swap = true
    
    init(_ values: [Int]) {
        self.n = values.count
        self.unsortedValues = values
        self.sortingValues = values
    }

    //Sortierschritt ausführen (durch Button getriggert)
    func stepAhead(_ graphView: Sortgraph) {
        if (self.swap) {
            var localSwapped = false
            for i in 0..<self.n - 1 {
                if (self.sortingValues[i] > self.sortingValues[i + 1]) {
                    self.sortingValues.swapAt(i, i + 1)
                    localSwapped = true // es wurde mindestens ein mal getauscht
                    //self.swap = true
                }
            }
            self.n -= 1
            if (localSwapped == false) {  //nichts wurde getauscht in diesem Durchgang
                self.swap = false  //nichts mehr zu machen -> fertig
            }
        }
        //Aktuellen Sortierzustand visualisieren
        graphView.values = self.sortingValues
    }
    
}
