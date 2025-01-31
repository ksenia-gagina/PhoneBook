//
//  TitleAndSubtitleTableCellView.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 25.01.2025.
//

import UIKit

final class TitleAndSubtitleTableCellView: UITableViewCell {
  
  // MARK: - Public propertes
  
  public static let reuseIdentifier = TitleAndSubtitleTableCellView.description()
  
  // MARK: - Private propertes
  
  private let nameLabel = UILabel()
  private let phoneNumberLabel = UILabel()
  
  // MARK: - Init
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    initialize()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Public func
  
  public func configure(with contact: Contact) {
    nameLabel.text = "\(contact.firstName) \(contact.lastName)"
    phoneNumberLabel.text = contact.phoneNumber
  }
}

// MARK: - Private funcs

private extension TitleAndSubtitleTableCellView {
  func initialize() {
    backgroundColor = .white
    contentView.backgroundColor = .white
    selectionStyle = .none
  }
  
  func setLayout() {
    [nameLabel, phoneNumberLabel].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.indentationFromTheSide),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.indentationFromTheSide),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.indentationFromTheSide),
      
      phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.distanceTop),
      phoneNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.indentationFromTheSide),
      phoneNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.indentationFromTheSide),
      phoneNumberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.indentationFromTheSide),
    ])
  }
}

// MARK: - Constants

private enum Constants {
  static let indentationFromTheSide: CGFloat = 16
  static let distanceTop: CGFloat = 6
}
