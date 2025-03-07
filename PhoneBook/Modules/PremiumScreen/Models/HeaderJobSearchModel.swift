//
//  HeaderJobSearchModel.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 20.02.2025.
//

import UIKit

struct HeaderJobSearchModel {
  let title: String
  let titleStyle: Information.Style
  let subtitle: String
  let subtitleStyle: Information.Style
  let searchButtonTitle: String
  let searchButtonStyle: RoundButton.Style
  var searchButtonAction: (() -> Void)?
}
  
