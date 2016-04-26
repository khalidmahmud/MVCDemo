//
//  ViewController.swift
//  MVCDemo
//
//  Created by Abu Khalid on 4/26/16.
//  Copyright © 2016 Abu Khalid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  //array to pass to model to calculate result
  var calculationArray = [String]()
  //Check if the = pressed
  var checkResultBool = false
  // Initialize the result
  var result: Int = 0
  
  //showing  the input/result
  @IBOutlet weak var testInputLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func buttonPressed(sender: UIButton) {
    let tag = sender.tag
    switch(tag) {
    //+
    case 10 :
      insertToArrayWith("+")
      return
    //-
    case 11:
      insertToArrayWith("-")
      return
    //=
    case 12 :
      //check if there is text in the label
      if(!(testInputLabel.text!.isEmpty)) {
        calculationArray.append("\(testInputLabel.text!)")
      }
      let length = calculationArray.count
      //checking if last object is number
      // also checking if the array is empty
      if (length != 0 && Int(calculationArray[length - 1]) != nil) {
        result = doCalculationUsing(calculationArray)
        testInputLabel.text = "\(result)"
        calculationArray.removeAll()
        //checking if we just calculated something
        checkResultBool = true
      }
      return
    //clear
    case 13 :
      testInputLabel.text = ""
      calculationArray.removeAll()
      return
    default :
      break
    }
    // Don't add anything when showing result
    if (checkResultBool == false) {
      testInputLabel.text?.appendContentsOf("\(tag)")
    } else {
      testInputLabel.text =  ""
      testInputLabel.text?.appendContentsOf("\(tag)")
      //setting the check to false again
      checkResultBool = false
    }
  }
  
  func insertToArrayWith(operatorSign : String) {
    //check if there is text in the label
    if(!(testInputLabel.text!.isEmpty)) {
      //force unwrap to get the value of text from the label
      calculationArray.append("\(testInputLabel.text!)")
    }
    let length = calculationArray.count
    //check # 1 checking if the first index is operator if it is operator not needed to append
    if(length != 0) {
      //check #2 checking if the previous index is operator
      if (Int(calculationArray[length - 1]) == nil) {
        calculationArray[length - 1] = operatorSign
      } else {
        calculationArray.append("\(operatorSign)")
      }
    }
    testInputLabel.text = ""
  }
  
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

