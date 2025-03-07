//
//  SeparatorCell.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 19.02.2025.
//

import UIKit

public final class SeparatorCell: UITableViewCell {
  
  public static let reuseIdentifier = SeparatorCell.description()

  public func configure(height: CGFloat = 1) {
    setLayout(height: height)
    initialize()
  }
}

private extension SeparatorCell {
  func setLayout(height: CGFloat) {

    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: height)
    ])
  }
  
  func initialize() {
    selectionStyle = .none
    backgroundColor = .systemGray
    contentView.backgroundColor = .systemGray
  }
}
