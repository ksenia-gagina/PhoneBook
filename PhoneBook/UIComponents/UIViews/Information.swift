//
//  Information.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 22.02.2025.
//

import UIKit

public final class Information: UIView {
  
  private let mainText = UILabel()
  
  func configure(text: String, style: Information.Style) {
    self.mainText.text = text
    
    setLayout()
    applyStyle(style: style)
  }
}

extension Information {
  public enum Style {
    case black
    case gray
  }
}

// MARK: - Private funcs

private extension Information {
  func setLayout() {
    [mainText].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      
      mainText.leadingAnchor.constraint(equalTo: leadingAnchor),
      mainText.topAnchor.constraint(equalTo: topAnchor),
      mainText.trailingAnchor.constraint(equalTo: trailingAnchor),
      mainText.bottomAnchor.constraint(equalTo: bottomAnchor),
      mainText.heightAnchor.constraint(equalToConstant: 16)
    ])
  }
  
  func  applyStyle(style: Information.Style) {
    
    switch style {
    case .black:
      mainText.textColor = .black
      mainText.font = .systemFont(ofSize: 16, weight: .bold)
      mainText.textAlignment = .left
      mainText.numberOfLines = 0

    case .gray:
      mainText.textColor = .gray
      mainText.font = .systemFont(ofSize: 12, weight: .light)
      mainText.textAlignment = .left
      mainText.numberOfLines = 0
    }
  }
}


