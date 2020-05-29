//
//  ViewController.swift
//  UberClone
//
//  Created by Jonathan Go on 5/28/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

  // MARK: - Properties
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "UBER"
    label.font = UIFont(name: "Avenir-Light", size: 34)
    label.textColor = UIColor(white: 1, alpha: 0.8)
    return label
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
  
  private let emailTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Email", isSecureTextEntry: false)
  }()
  
  private let passwordTextField: UITextField = {
    return UITextField().textField(withPlaceHolder: "Password", isSecureTextEntry: true)
  }()
  
  private let loginButton: AuthButton = {
    let button = AuthButton(type: .system)
    button.setTitle("Log In", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    return button
  }()
  
  let dontHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    
    let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
    button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
  }()
  
  
  // MARK: - Lifecyle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }

//  override var preferredStatusBarStyle: UIStatusBarStyle {
//    return .lightContent
//  }
  
  // MARK: - Selectors
  @objc func handleShowSignUp() {
    let controller = SignUpController()
    navigationController?.pushViewController(controller, animated: true)
  }

  
  // MARK: - Helper
  func configureUI() {
    configureNavBar()
    
    view.backgroundColor = .backgroundColor
      
    view.addSubview(titleLabel)
    titleLabel.centerX(inView: view)
    titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 24
    
    view.addSubview(stack)
    stack.anchor(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
    
    view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.centerX(inView: view)
    dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
  }
  
  func configureNavBar() {
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
  }
}

