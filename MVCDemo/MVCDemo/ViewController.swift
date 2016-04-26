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
  //model object
  var calculationModel = Calculation()
  //Check if the = just pressed
  var checkResultBool = false
  
  //showing  the input/result
  @IBOutlet weak var testInputLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    testInputLabel.numberOfLines = 0
    testInputLabel.adjustsFontSizeToFitWidth = true
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
        let result = calculationModel.doCalculationUsing(calculationArray)
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
  
}

