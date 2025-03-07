//
//  HeaderCell.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 19.02.2025.
//

import UIKit

public final class HeaderCell: UITableViewCell {
  
  public static let reuseIdentifier = HeaderCell.description()
  
  private let circleImageView = CircleImageView()
  private let inputTextView = InputView()
  private let buttonView = UIButton()
  private let horizontalStackView = UIStackView()
  private var messageButtonAction: (() -> Void)?
  
  public func configure(
    image: UIImage?,
    setDefaultText: String?,
    textFieldChange: ((String) -> Void)?,
    messageButtonAction: (() -> Void)?
  ) {
    circleImageView.setImage(image, style: .middle)
    inputTextView.setText(setDefaultText)
    inputTextView.textFieldChange = textFieldChange
    self.messageButtonAction = messageButtonAction
    
    setLayout()
    initialize()
  }
}

private extension HeaderCell {
  func setLayout() {
    [circleImageView, inputTextView, buttonView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      horizontalStackView.addArrangedSubview($0)
    }
    [horizontalStackView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      buttonView.heightAnchor.constraint(equalToConstant: 44),
      buttonView.widthAnchor.constraint(equalToConstant: 44),
      
      horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
      horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

  func initialize() {
    selectionStyle = .none
    
    
    buttonView.addTarget(self, action: #selector(messageButton), for: .touchUpInside)
    buttonView.setImage(UIImage(systemName: "ellipsis.message"), for: .normal)
    horizontalStackView.spacing = 8
  }
  
  @objc
  func messageButton() {
    messageButtonAction?()
  }
}
