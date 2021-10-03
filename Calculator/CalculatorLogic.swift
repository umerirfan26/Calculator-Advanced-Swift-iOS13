//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Muhammad Umer on 28/06/2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
   private var intermediateCalculator: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
               return 0
            case "%":
               return n * 0.01
                case "=":
               return performTwoNumCalculation(n2: n)
            default:
               intermediateCalculator = (n1: n, calcMethod: symbol)
            }
        }
        return nil
        
               }
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculator?.n1,
            let operation = intermediateCalculator?.calcMethod {
            
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
                fatalError("operation does not match")
            }
        }
        return nil
    }
}
