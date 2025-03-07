//
//  HeaderButtonCell.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 19.02.2025.
//

import UIKit

public final class HeaderButtonsCell: UITableViewCell {
  
  public static let reuseIdentifier = HeaderButtonsCell.description()
  
  private let leftButton = RoundButton()
  private let centerButton = RoundButton()
  private let rightButton = RoundButton()
  private let horizontalStackView = UIStackView()
  
  public func configure(
    leftTitle: String, leftStyle: RoundButton.Style, leftAction: (() -> Void)?,
    centerTitle: String, centerStyle: RoundButton.Style, centerAction: (() -> Void)?,
    rightTitle: String, rightStyle: RoundButton.Style, rightAction: (() -> Void)?
  ) {
    leftButton.configure(title: leftTitle, style: leftStyle, action: leftAction)
    centerButton.configure(title: centerTitle, style: centerStyle, action: centerAction)
    rightButton.configure(title: rightTitle, style: rightStyle, action: rightAction)

    setLayout()
    initialize()
  }
}

private extension HeaderButtonsCell {
  func setLayout() {
    [leftButton, centerButton, rightButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      horizontalStackView.addArrangedSubview($0)
    }
    [horizontalStackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
      horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
    ])
  }

  func initialize() {
    backgroundColor = .white
    selectionStyle = .none
    
    horizontalStackView.spacing = 8
  }
}

