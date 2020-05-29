//
//  UIView+Ext.swift
//  UberClone
//
//  Created by Jonathan Go on 5/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

extension UIView {
  func inputContainerView(image: UIImage, textField: UITextField? = nil, segmentedControl: UISegmentedControl? = nil) -> UIView {
    let inputView = UIView()
    
    let imageView = UIImageView()
    imageView.image = image
    imageView.alpha = 0.87
    inputView.addSubview(imageView)
    
    if let textField = textField {
      imageView.centerY(inView: inputView)
      imageView.anchor(leading: inputView.leadingAnchor, paddingLeft: 8, width: 24, height: 24)
    
      inputView.addSubview(textField)
      textField.centerY(inView: inputView)
      textField.anchor(leading: imageView.trailingAnchor, bottom: inputView.bottomAnchor,
                       trailing: inputView.trailingAnchor, paddingLeft: 8)
    }
    
    if let sc = segmentedControl {
      imageView.anchor(top: inputView.topAnchor, leading: inputView.leadingAnchor, paddingTop: -8, paddingLeft: 8, width: 24, height: 24)
      
      inputView.addSubview(sc)
      sc.anchor(leading: inputView.leadingAnchor, trailing: inputView.trailingAnchor, paddingLeft: 8, paddingRight: 8)
      sc.centerY(inView: inputView, constant: 8)
    }
    
    let separatorView = UIView()
    separatorView.backgroundColor = UIColor.lightGray
    inputView.addSubview(separatorView)
    separatorView.anchor(leading: inputView.leadingAnchor, bottom: inputView.bottomAnchor,
                         trailing: inputView.trailingAnchor, paddingLeft: 8, height: 0.75)
    
    return inputView
  }
  
  func anchor(top: NSLayoutYAxisAnchor? = nil,
              leading: NSLayoutXAxisAnchor? = nil,
              bottom: NSLayoutYAxisAnchor? = nil,
              trailing: NSLayoutXAxisAnchor? = nil,
              paddingTop: CGFloat = 0,
              paddingLeft: CGFloat = 0,
              paddingBottom: CGFloat = 0,
              paddingRight: CGFloat = 0,
              width: CGFloat? = nil,
              height: CGFloat? = nil) {
      
    translatesAutoresizingMaskIntoConstraints = false
      
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
      
    if let leading = leading {
      leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
    }
      
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }
      
    if let trailing = trailing {
      trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
    }
      
    if let width = width {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
      
    if let height = height {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
  
  func centerX(inView view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  func centerY(inView view: UIView, trailingAnchor: NSLayoutXAxisAnchor? = nil,
               paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
      
    translatesAutoresizingMaskIntoConstraints = false
    centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
      
    if let trailing = trailingAnchor {
      anchor(trailing: trailing, paddingLeft: paddingLeft)
    }
  }
  
  func setDimensions(height: CGFloat, width: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    heightAnchor.constraint(equalToConstant: height).isActive = true
    widthAnchor.constraint(equalToConstant: width).isActive = true
  }
}
