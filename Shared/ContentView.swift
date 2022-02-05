//
//  ContentView.swift
//  Shared
//
//  Created by Shayarneel Kundu on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var harmonicSeries = HarmonicSeries()
    
    @State var nval = "1"
    @State var sumUpString = ""
    @State var sumDownString = ""
    @State var RelativeErrorString = ""

    
    var body: some View {
        
        // This one is for the order
        HStack(alignment: .center){
            Text("Order:")
            TextField("Enter Order", text: $nval, onCommit: self.Sum)
            
        }.padding()
        
        HStack{
            // This HStack that lists the sums and the errors
            
            VStack{
                // This VStack lists out the sums one below the other
                
                HStack{
                    
                    Text("Sum Up:")
                    TextField("", text: $sumUpString)
                    
                }.padding()
                
                HStack{
                    
                    Text("Sum Down:")
                    TextField("", text: $sumDownString)
                    
                }.padding()
                
                
                VStack{
                    // This VStack has the relative error
                    
                    HStack{
                        
                        Text("Sum One Error:")
                        TextField("", text: $RelativeErrorString)
                        
                    }.padding()
                    
                    
                }
                
                Button("Calculate Harmonic Series", action: {self.Sum()} )

                
            }
            
            
            
            
        }
        
        
    
        
    }
    
    func Sum() {
        
        let correctInteger = Int((Double(nval)! + 0.5))
        
        let sumUpVal = harmonicSeries.UpCalc(function: harmonicSeries.SummationFucntion(n:), minimum: 1, maximum: correctInteger)
        let sumDownVal = harmonicSeries.DownCalc(function: harmonicSeries.SummationFucntion(n:), minimum: 1, maximum: correctInteger)
        
        let relError = harmonicSeries.ErrorCalculator(Val1: sumUpVal, Val2: sumDownVal)
        
        sumUpString = String(sumUpVal)
        sumDownString = String(sumDownVal)
   
        RelativeErrorString = String(relError)

    }


}
