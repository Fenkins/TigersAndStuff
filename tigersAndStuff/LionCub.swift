//
//  LionCub.swift
//  tigersAndStuff
//
//  Created by Fenkins on 17/02/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import Foundation

class LionCub:Lion {
    func rubLionCubsBelly () {
        println("LionCub: Snuggle and be happy")
    }
    
//override описанный ниже будет работать до тех пор, пока не вызвана super.roar, только в этом случае львёнок начнет рычать как взрослый
    
    func superRoar() {
        self.roar()
        super.roar()
        
    }
    override func roar () {
        println("craw craw")
    }
    
    
}