//
//  CircleImage.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 19.02.2025.
//

import UIKit

public final class CircleImageView: UIView {
  
  private let imageView = UIImageView()
  
  // MARK: - Public funcs
  
  public func setImage(_ image: UIImage?, style: CircleImageView.Style) {
    imageView.image = image
    
    setLayout(style: style)
    initialize(style: style)
  }
}

public extension CircleImageView {
  enum Style {
    case small
    case middle
    case large
    
    public var size: CGFloat {
      switch self {
      case .small:
        return 32
      case .middle:
        return 48
      case .large:
        return 64
      }
    }
  }
}

// MARK: - Private funcs

private extension CircleImageView {
  func setLayout(style: CircleImageView.Style) {
    [imageView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalToConstant: style.size),
      imageView.widthAnchor.constraint(equalToConstant: style.size),
      
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  func initialize(style: CircleImageView.Style) {
    imageView.layer.cornerRadius = style.size / 2
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
  }
}



