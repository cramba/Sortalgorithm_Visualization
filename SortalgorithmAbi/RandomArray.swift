//
//  RandomArray.swift
//  SortalgorithmAbi
//
//  Created by Marc Bachmann on 02.07.18.
//  Copyright © 2018 Marc Bachmann. All rights reserved.
//

import Foundation

class RandomArray {
    var count: Int
    let max: UInt32
    
    
    init(count:Int, max: Int){
        self.count = count
        self.max = UInt32(max)
    }
    
    func createRandomArray() -> [Int] {
        return (1...self.count).map{_ in Int(arc4random_uniform(self.max)) + 1}
    }
}
