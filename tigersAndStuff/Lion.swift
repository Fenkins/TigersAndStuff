//
//  Lion.swift
//  tigersAndStuff
//
//  Created by Fenkins on 17/02/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import Foundation
import UIkit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage (named: "")
    var name = ""
    var subspecies = ""


    func changeToAlpha () {
        self.isAlphaMale = true
    }
    
    func roar () {
        println("Roar Roar")
    }
}

