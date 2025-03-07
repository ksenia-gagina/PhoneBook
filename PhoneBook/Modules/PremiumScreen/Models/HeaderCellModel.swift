//
//  HeaderCellModel.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 19.02.2025.
//

import UIKit

struct HeaderCellModel {
  let avatar: UIImage?
  let text: String?
  var textFieldChange: ((String) -> Void)?
  var messageButtonAction: (() -> Void)?
}
