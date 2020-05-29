//
//  SignUpController.swift
//  UberClone
//
//  Created by Jonathan Go on 5/29/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
  // MARK: - Properties
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "UBER"
    label.font = UIFont(name: "Avenir-Light", size: 34)
    label.textColor = UIColor(white: 1, alpha: 0.8)
    return label
  }()
  
  private lazy var fullNameContainerView: UIView = {
    let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullNameTextField)
    view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return view
  }()
  
  private lazy var emailContainerView: UIView = {
    let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
    view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return view
  }()
  
  private lazy var passwordContainerView: UIView = {
      let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
      view.heightAnchor.constraint(equalToConstant: 50).isActive = true
      return view
  }()
  
  private lazy var accountTypeContainerView: UIView = {
      let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_account_box_white_2x"), segmentedControl: accountTypeSegmentedControl)
      view.heightAnchor.constraint(equalToConstant: 80).isActive = true
      return view
  }()
  
  
  private let fullNameTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Full Name", isSecureTextEntry: false)
  }()
  
  private let emailTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Email", isSecureTextEntry: false)
  }()
  
  private let passwordTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Password", isSecureTextEntry: true)
  }()
  
  private let signupButton: AuthButton = {
    let button = AuthButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    return button
  }()
  
  private let accountTypeSegmentedControl: UISegmentedControl = {
    let sc = UISegmentedControl(items: ["Rider", "Driver"])
    sc.backgroundColor = .backgroundColor
    sc.tintColor = UIColor(white: 1, alpha: 0.87)
    sc.selectedSegmentIndex = 0
    return sc
  }()
  
  let alreadyHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    
    let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
    button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
  }()
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // MARK: - Helper
  func configureUI() {
    view.backgroundColor = .backgroundColor
      
    view.addSubview(titleLabel)
    titleLabel.centerX(inView: view)
    titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, fullNameContainerView, passwordContainerView, accountTypeContainerView, signupButton])
    stack.axis = .vertical
    stack.distribution = .fillProportionally
    stack.spacing = 24
    
    view.addSubview(stack)
    stack.anchor(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
    
    view.addSubview(alreadyHaveAccountButton)
    alreadyHaveAccountButton.centerX(inView: view)
    alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
  }
  
  // MARK: - Selectors
  @objc func handleShowLogin() {
    navigationController?.popViewController(animated: true)
  }
}
