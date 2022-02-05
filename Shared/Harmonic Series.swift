//
//  Harmonic Series.swift
//  HW2-HarmonicSeries
//
//  Created by Shayarneel Kundu on 2/3/22.
//

import Foundation
import SwiftUI


typealias nthTerm = (_ parameters: Int) -> Double

class HarmonicSeries: ObservableObject {
    
    
    //First, compute the sum upeards because that is what most sane individuals do
    
    func UpCalc(function: nthTerm, minimum: Int, maximum: Int) -> Double{
        
        var sumUp = 0.0
        
        for n in minimum...maximum {
            
            sumUp += function(n)
        }
        
        return sumUp
    }
    
    //Now, what the crazies do, backwards!
    
    func DownCalc(function: nthTerm, minimum: Int, maximum: Int) -> Double{
        
        var sumBack = 0.0
        
        for n in (minimum...maximum).reversed() {
            
            sumBack += function(n)
        }
        
        return sumBack
    }
    
    func SummationFucntion(n: Int) -> Double{
        
        return 1.0/Double(n)
        
    }
    
    func ErrorCalculator(Val1: Double, Val2: Double) -> Double{
        
        let error = abs(Val1 - Val2)/(abs(Val1) + abs(Val2))
        
        return error
    }
}
