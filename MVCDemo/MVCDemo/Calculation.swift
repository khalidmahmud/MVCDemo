//
//  Calculation.swift
//  MVCDemo
//
//  Created by Abu Khalid on 4/26/16.
//  Copyright © 2016 Abu Khalid. All rights reserved.
//

import UIKit

class Calculation: NSObject {
  
  //returning result
  var result: Int = 0
  
  func doCalculationUsing(calculateArray: [String]) -> (Int) {
    
    //while calling this method from controller it was ensured that 1st index of array is number
    result = Int(calculateArray[0])!
    
    //checking which operation to perform
    var operatorString = ""
    
    //loop continues to find the result
    for i in 2.stride(to: calculateArray.count, by: 2) {
      operatorString = calculateArray[i - 1]
      
      switch(operatorString) {
      case "+":
        result = doSumWith(result, number2: Int(calculateArray[i])!)
        break
      case "-":
        result = doSubWith(result, number2: Int(calculateArray[i])!)
        break
      default :
        break
      }
    }
    //return the result
    return result
  }
  
  // do the addition
  func doSumWith(number1: Int, number2:Int)->(Int) {
    return number1 + number2
  }
  
  // do the substraction
  func doSubWith(number1: Int, number2:Int)->(Int) {
    return number1 - number2
  }
  
}
