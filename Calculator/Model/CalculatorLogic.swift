//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Apple on 4/12/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermediateCalculation : (n1 :  Double, calcMethod : String)?
    
    mutating func setNumber(_ Number : Double){
        self.number = Number
        
    }
    
    
    
    mutating func calculate(symbol:String)->Double?{
        
        if let n = number{
            
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performtwoNumberCalculation(n2: n)
                
            default:
                intermediateCalculation = (n1 :  n, calcMethod : symbol)
                
            }
            
        }
        return nil
    }
    
    private  func performtwoNumberCalculation(n2:Double) -> Double?{
        
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod{
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The opeartion passed in does not match any off the cases")
            }
            
        }
        
        return nil
        
    }
    
    
}

