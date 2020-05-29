//
//  UIColor+Ext.swift
//  UberClone
//
//  Created by Jonathan Go on 5/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

extension UIColor {
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
  }
  
  static let backgroundColor = UIColor.rgb(red: 25, green: 25, blue: 25)
  static let mainBlueTint = UIColor.rgb(red: 17, green: 154, blue: 237)
}
