//
//  RoundButton.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 19.02.2025.
//

import UIKit

public final class RoundButton: UIView {
  
  private let button = UIButton()
  private var buttonAction: (() -> Void)?
  
  func configure(title: String, style: RoundButton.Style, action: (() -> Void)?) {
    button.setTitle(title, for: .normal)
    buttonAction = action
    setLayout()
    initial(style: style)
  }
}

extension RoundButton {
  public enum Style {
    case blue
    case ghost
  }
}

// MARK: - Private funcs

private extension RoundButton {
  func setLayout() {
    [button].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      button.heightAnchor.constraint(equalToConstant: 52),
      button.widthAnchor.constraint(equalToConstant: 120),
      
      button.leadingAnchor.constraint(equalTo: leadingAnchor),
      button.topAnchor.constraint(equalTo: topAnchor),
      button.trailingAnchor.constraint(equalTo: trailingAnchor),
      button.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  func initial(style: RoundButton.Style) {
    button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    
    switch style {
    case .blue:
      button.backgroundColor = .blue
      button.layer.cornerRadius = 16
      button.clipsToBounds = true
      button.setTitleColor(.white, for: .normal)
      button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
      button.contentHorizontalAlignment = .center
      
    case .ghost:
      button.backgroundColor = .white
      button.layer.cornerRadius = 16
      button.clipsToBounds = true
      button.setTitleColor(.black, for: .normal)
      button.layer.borderWidth = 1
      button.layer.borderColor = UIColor.gray.cgColor
      button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
      button.contentHorizontalAlignment = .center
    }
  }
  
  @objc func touchUpInside() {
    buttonAction?()
  }
}
