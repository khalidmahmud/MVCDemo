//
//  CustomOperatorButton.swift
//  MVCDemo
//
//  Created by Abu Khalid on 4/26/16.
//  Copyright © 2016 Abu Khalid. All rights reserved.
//

import UIKit

class CustomOperatorButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.backgroundColor = UIColor.orangeColor()
  }
}
