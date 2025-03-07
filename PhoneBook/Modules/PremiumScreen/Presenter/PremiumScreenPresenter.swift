//
//  PremiumScreenPresenter.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 07.03.2025.
//

import UIKit

protocol PremiumScreenPresenterInput {}
protocol PremiumScreenPresenterOutput: AnyObject {}

final class PremiumScreenPresenter: UIViewController {
  
  weak var output: PremiumScreenPresenterOutput?
  
  let moduleView: UIView & PremiumScreenViewInput
  let factory: PremiumScreenFactoryInput
  let interactor: PremiumScreenInteractorInput
  
  init(
    moduleView: UIView & PremiumScreenViewInput,
    factory: PremiumScreenFactoryInput,
    interactor: PremiumScreenInteractorInput
  ) {
    self.moduleView = moduleView
    self.factory = factory
    self.interactor = interactor
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    view = moduleView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}

// MARK: - PremiumScreenPresenterInput

extension PremiumScreenPresenter: PremiumScreenPresenterInput {
  
}

// MARK: - PremiumScreenFactoryOutput

extension PremiumScreenPresenter: PremiumScreenFactoryOutput {
  
  func didcreateContent(listName: [String]) {
    moduleView.confure(models: listName)
  }
}

// MARK: - PremiumScreenInteractorOutput

extension PremiumScreenPresenter: PremiumScreenInteractorOutput {
  func didReceiveListName(_ listName: [String]) {
    factory.createContent(listName: listName)
  }
  
  func somethingWentWrong() {
    return
  }
  
  
  
}

// MARK: - PremiumScreenInteractorOutput

extension PremiumScreenPresenter: PremiumScreenViewOutput {
  func userTappedRetryRegust() {}
}

