//
//  LocationInputActivationView.swift
//  UberClone
//
//  Created by Jonathan Go on 5/30/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

protocol LocationInputActivationViewDelegate: class {
  func pressentLocationInputView()
}

class LocationInputActivationView: UIView {
  // MARK: - Properties
  weak var delegate: LocationInputActivationViewDelegate?
  
  private let indicatorView: UIView = {
    let v = UIView()
    v.backgroundColor = .black
    return v
  }()
  
  private let placeholderLabel: UILabel = {
    let label = UILabel()
    label.text = "where to?"
    label.font = UIFont.systemFont(ofSize: 18)
    label.textColor = .darkGray
    return label
  }()
  
  // MARK: - Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureUI()
    configureGestureRecognizer()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - Selectors
  @objc func presentLocationInputView() {
    delegate?.pressentLocationInputView()
  }
  
  // MARK: - Helper Functions
  func configureUI() {
    backgroundColor = .white
    addShadow()
    
    addSubview(indicatorView)
    indicatorView.centerY(inView: self, leadingAnchor: leadingAnchor, paddingLeft: 16)
    indicatorView.setDimensions(height: 6, width: 6)
    
    addSubview(placeholderLabel)
    placeholderLabel.centerY(inView: self, leadingAnchor: indicatorView.trailingAnchor, paddingLeft: 20)
  }
  
  func configureGestureRecognizer() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(presentLocationInputView))
    addGestureRecognizer(tap)
  }
}
