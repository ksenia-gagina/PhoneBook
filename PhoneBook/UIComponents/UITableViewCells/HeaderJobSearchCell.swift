//
//  HeaderJobSearchCell.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 20.02.2025.
//

import UIKit

public final class HeaderJobSearchCell: UITableViewCell {
  
  public static let reuseIdentifier = HeaderJobSearchCell.description()
  
  private let heading = Information()
  private let preface = Information()
  private let button = RoundButton()
  private let verticalStackView = UIStackView()
  private var messageButtonAction: (() -> Void)?
  
  public func configure(
    title: String,
    titleStyle: Information.Style,
    subtitle: String,
    subtitleStyle: Information.Style,
    searchButtonTitle: String, searchButtonStyle: RoundButton.Style, searchButtonAction: (() -> Void)?
  ) {
    heading.configure(text: title, style: titleStyle)
    preface.configure(text: subtitle, style: subtitleStyle)
    button.configure(title: searchButtonTitle, style: searchButtonStyle, action: searchButtonAction)
    
    setLayout()
    initialize()
    
  }
}

private extension HeaderJobSearchCell {
  func setLayout() {
    [heading, preface, button].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      verticalStackView.addArrangedSubview($0)
    }
    [verticalStackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
      verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 52),
      
      button.heightAnchor.constraint(equalToConstant: 44),
      button.widthAnchor.constraint(equalToConstant: 56)
    ])
  }
  
  func initialize() {
    backgroundColor = .white
    selectionStyle = .none
    
    
    verticalStackView.axis = .vertical
    verticalStackView.spacing = 8
    
  }
}
