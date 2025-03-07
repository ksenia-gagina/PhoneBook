//
//  HeaderButtonCellModel.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 19.02.2025.
//

import Foundation

struct HeaderButtonsCellModel {
  let leftTitle: String
  let leftStyle: RoundButton.Style
  let leftAction: (() -> Void)?
  
  let centerTitle: String
  let centerStyle: RoundButton.Style
  let centerAction: (() -> Void)?
  
  let rightTitle: String
  let rightStyle: RoundButton.Style
  let rightAction: (() -> Void)
}
