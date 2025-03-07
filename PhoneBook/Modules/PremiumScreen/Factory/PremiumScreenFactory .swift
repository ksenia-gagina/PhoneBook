//
//  PremiumScreenFactory.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 07.03.2025.
//

import UIKit

protocol PremiumScreenFactoryInput {
  func createContent(listName: [String])
}
protocol PremiumScreenFactoryOutput: AnyObject {
  func didcreateContent()
}

final class PremiumScreenFactory {
  
  weak var output: PremiumScreenFactoryOutput?
}

extension PremiumScreenFactory: PremiumScreenFactoryInput {
  func createContent(listName: [String]) {
    var models: [Any] = []
    
    listName.forEach {
      models.append(SeparatorCellModel(height: 8))
      
      models.append(
        HeaderCellModel(
          avatar: UIImage(named: "IMG_0198"),
          text: $0,
          textFieldChange: { text in
            print("Текст: \(text)")
          },
          messageButtonAction: {
            print("Кнопка была начата")
          }
        )
      )
    }
    
    models.append(SpacerCellModel(height: 10))
    models.append(SeparatorCellModel(height: 1))
    models.append(SpacerCellModel(height: 10))
    
    models.append(
      HeaderButtonsCellModel(
        leftTitle: "Preferences",
        leftStyle: .ghost,
        leftAction: {
          print("Нажата левая кнопка")
        },
        centerTitle: "My jobs",
        centerStyle: .ghost,
        centerAction: {
          print("Нажата центральная кнопка")
        },
        rightTitle: "Post a free job",
        rightStyle: .ghost,
        rightAction: {
          print("Нажата правая кнопка")
        }
      )
    )
    
    models.append(SpacerCellModel(height: 10))
    models.append(SeparatorCellModel(height: 8))
    
    models.append(
      HeaderJobSearchModel(
        title: "Get notifield about jobs you're interested in ",
        titleStyle: .black,
        subtitle: "Create an alert for a job title, company, or keywords ",
        subtitleStyle: .gray,
        searchButtonTitle: "Create alert ",
        searchButtonStyle: .blue,
        searchButtonAction: {
          print("Кнопка создать оповещение нажата")
        }
      )
    )
  }
  
}
