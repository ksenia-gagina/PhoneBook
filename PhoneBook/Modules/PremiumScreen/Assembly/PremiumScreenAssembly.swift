//
//  PremiumScreenAssembly.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 07.03.2025.
//

import UIKit

final class PremiumScreenAssembly {
  
  func createModule() -> UIViewController & PremiumScreenPresenterInput {
    let factory = PremiumScreenFactory()
    let interactor = PremiumScreenInteractor()
    let view = PremiumScreenView()
    let presenter = PremiumScreenPresenter(moduleView: view, factory: factory, interactor: interactor)
    factory.output = presenter
    interactor.output = presenter
    view.output = presenter
    return presenter
  }
  
}
