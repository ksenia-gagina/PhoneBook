//
//  MainScreenViewController.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 25.01.2025.
//

import UIKit

final class MainScreenViewController: UIViewController {
  
  // MARK: - Private propertes
  
  private let moduleView = MainScreenView()
  
  // MARK: - Init
  
  override func loadView() {
    view = moduleView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
