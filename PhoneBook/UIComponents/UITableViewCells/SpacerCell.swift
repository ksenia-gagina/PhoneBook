//
//  SpacerCell.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 19.02.2025.
//

import UIKit

public final class SpacerCell: UITableViewCell {
  
  public static let reuseIdentifier = SpacerCell.description()
  
  public func configure(height: CGFloat) {
    setLayout(height: height)
    initialize()
  }
}

private extension SpacerCell {
  func setLayout(height: CGFloat) {
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: height)
    ])
  }
  
  func initialize() {
    selectionStyle = .none
    backgroundColor = .clear
    contentView.backgroundColor = .clear
  }
}
