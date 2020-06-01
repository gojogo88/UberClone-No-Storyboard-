//
//  LocationInputCell.swift
//  UberClone
//
//  Created by Jonathan Go on 6/1/20.
//  Copyright © 2020 SonnerStudio. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

  // MARK: - Properties
  static let reuseIdentifier = "LocationInputCell"
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .darkGray
    label.text = "123 Main Street"
    return label
  }()
  
  private let addressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .lightGray
    label.text = "123 Main Street, Washington DC"
    return label
  }()
  
  // MARK: - Lifecycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    selectionStyle = .none
    
    let stack = UIStackView(arrangedSubviews: [titleLabel, addressLabel])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 4
    
    addSubview(stack)
    stack.centerY(inView: self, leadingAnchor: leadingAnchor, paddingLeft: 12)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
