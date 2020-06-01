//
//  LocationInputView.swift
//  UberClone
//
//  Created by Jonathan Go on 6/1/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

protocol LocationInputViewDelegate: class {
  func dismissLocationInputView()
}

class LocationInputView: UIView {
  // MARK: - Properties
  weak var delegate: LocationInputViewDelegate?
  
  private let backButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp").withRenderingMode(.alwaysOriginal), for: .normal)
    button.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
    return button
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Jonathan"
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()
  
  private let startLocationIndicatorView: UIView = {
      let view = UIView()
      view.backgroundColor = .lightGray
      return view
  }()
  
  private let linkingView: UIView = {
      let view = UIView()
      view.backgroundColor = .darkGray
      return view
  }()
  
  private let destinationIndicatorView: UIView = {
      let view = UIView()
      view.backgroundColor = .black
      return view
  }()
  
  private lazy var startingLocationTextField: UITextField = {
      let tf = UITextField()
      tf.placeholder = "Current Location"
      tf.backgroundColor = .systemGroupedBackground
      tf.isEnabled = false
      tf.font = UIFont.systemFont(ofSize: 14)
      
      let paddingView = UIView()
      paddingView.setDimensions(height: 30, width: 8)
      tf.leftView = paddingView
      tf.leftViewMode = .always
      
      return tf
  }()
  
  private lazy var destinationTextField: UITextField = {
      let tf = UITextField()
      tf.placeholder = "Enter a destination.."
      tf.backgroundColor = UIColor.rgb(red: 215, green: 215, blue: 215)
      tf.returnKeyType = .search
      tf.font = UIFont.systemFont(ofSize: 14)
      
    let paddingView = UIView()
      paddingView.setDimensions(height: 30, width: 8)
      tf.leftView = paddingView
      tf.leftViewMode = .always
      //tf.delegate = self
      tf.clearButtonMode = .whileEditing
      return tf
  }()
  
  // MARK: - Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addShadow()
    
    backgroundColor = .white
    
    addSubview(backButton)
    backButton.anchor(top: topAnchor, leading: leadingAnchor, paddingTop: 44, paddingLeft: 12, width: 24, height: 24)
    
    addSubview(titleLabel)
    titleLabel.centerY(inView: backButton)
    titleLabel.centerX(inView: self)
    
    addSubview(startingLocationTextField)
    startingLocationTextField.anchor(top: backButton.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 4, paddingLeft: 40, paddingRight: 40, height: 30)
    
    addSubview(destinationTextField)
    destinationTextField.anchor(top: startingLocationTextField.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 12, paddingLeft: 40, paddingRight: 40, height: 30)
    
    addSubview(startLocationIndicatorView)
    startLocationIndicatorView.setDimensions(height: 6, width: 6)
    startLocationIndicatorView.layer.cornerRadius = 6 / 2
    startLocationIndicatorView.centerY(inView: startingLocationTextField, leadingAnchor: leadingAnchor, paddingLeft: 20)
    
    addSubview(destinationIndicatorView)
    destinationIndicatorView.setDimensions(height: 6, width: 6)
    //destinationIndicatorView.layer.cornerRadius = 6 / 2
    destinationIndicatorView.centerY(inView: destinationTextField, leadingAnchor: leadingAnchor, paddingLeft: 20)
    
    addSubview(linkingView)
    linkingView.centerX(inView: startLocationIndicatorView)
    linkingView.anchor(top: startLocationIndicatorView.bottomAnchor, bottom: destinationIndicatorView.topAnchor, paddingTop: 4, paddingBottom: 4, width: 0.5)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - Selectors
  @objc func handleBackTapped() {
    delegate?.dismissLocationInputView()
  }
}
