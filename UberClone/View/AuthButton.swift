//
//  AuthButton.swift
//  UberClone
//
//  Created by Jonathan Go on 5/29/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class AuthButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setTitleColor(.white, for: .normal)
    backgroundColor = .mainBlueTint
    layer.cornerRadius = 8
    
    translatesAutoresizingMaskIntoConstraints = false
    heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
