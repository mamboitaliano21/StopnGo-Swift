//
//  LightLogic.swift
//  StopnGo
//
//  Created by Denis Thamrin on 27/10/2014.
//  Copyright (c) 2014 ___DenisThamrin___. All rights reserved.
//

import Foundation

class LightLogic {
    var safeToPress:Bool = true
    
    init(){
        
    }
    
    
    func updateLightLogic(second:UInt8,minute:UInt8){
        if(second % 7 == 0){
            self.safeToPress = false
        }
        else {
            self.safeToPress = true
        }
    }
    // Time in seconds for how long the light should be green
    
}