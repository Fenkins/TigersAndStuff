//
//  Tiger.swift
//  tigersAndStuff
//
//  Created by Fenkins on 10/02/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import Foundation
import UIkit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named: "")
    
    func chaff () {
        println("Chaff Chaff")
    }
    
    func chaffNumberOfTimes (numberOfTimes:Int) {
        for var chaff = 0; chaff < numberOfTimes; chaff++ {
            self.chaff()
        }
    }
    
    func chaffNumberOfTimes (numberOfTimes:Int, isLoud:Bool) {
        for var chaffTimes = 1; chaffTimes <= numberOfTimes; chaffTimes++ {
            if isLoud {
                chaff()
            }
            else {
                println("Purr Purr Purr")
            }
        }
    }
    
    func tigerAge (regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }
    
    func randomFact () -> String {
        var rand = Int(arc4random_uniform(3))
        var randomFact:String
        
        if rand == 0 {
            randomFact = "Tigers are so cool"
        }
        else if rand == 1 {
            randomFact = "Tigers are soft and warm"
        }
        else {
            randomFact = "Tigers run fast and live on the trees"
        }
        return randomFact
    }
    
}
