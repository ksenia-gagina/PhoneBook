//
//  PremiumScreenInteractor.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 07.03.2025.
//

import UIKit

protocol PremiumScreenInteractorInput {
  func getListName()
}
protocol PremiumScreenInteractorOutput: AnyObject {
  func didReceiveListName(_ listName: [String])
  func somethingWentWrong()
}

final class PremiumScreenInteractor {
  
  weak var output: PremiumScreenInteractorOutput?
}
  
extension PremiumScreenInteractor: PremiumScreenInteractorInput {
  func getListName() {
    DispatchQueue.global().async {
      let listName: [String]? = ["Аня","Света", "Марина"]
      
      DispatchQueue.main.async { [weak self ] in
        guard let self = self else { return }
        
        if let listName {
          output?.didReceiveListName(listName)
        } else {
          output?.somethingWentWrong()
          
        }
        
      }
    }
  }
}
