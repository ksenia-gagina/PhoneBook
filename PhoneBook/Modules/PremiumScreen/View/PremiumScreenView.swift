//
//  PremiumScreenView.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 07.03.2025.
//

import UIKit

protocol PremiumScreenViewInput {
  func confure(models: [Any])
}
protocol PremiumScreenViewOutput: AnyObject {}

final class PremiumScreenView: UIView {
  
  weak var output: PremiumScreenViewOutput?
  
  private let tableview = UITableView()
  private var models: [Any] = []
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setLayout()
    initialize()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - PremiumScreenViewInput


extension PremiumScreenView: PremiumScreenViewInput {
  func confure(models: [Any]) {
    self.models = models
    tableview.reloadData()
  }
  
}

private extension PremiumScreenView {
  func setLayout() {
    [tableview].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      tableview.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableview.topAnchor.constraint(equalTo: topAnchor),
      tableview.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableview.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  func initialize() {
    backgroundColor = .white
    tableview.backgroundColor = .white
    
    tableview.delegate = self
    tableview.dataSource = self
    tableview.rowHeight = UITableView.automaticDimension
    tableview.estimatedRowHeight = 40
    tableview.separatorStyle = .none
    
    tableview.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.reuseIdentifier)
    tableview.register(SeparatorCell.self, forCellReuseIdentifier: SeparatorCell.reuseIdentifier)
    tableview.register(SpacerCell.self, forCellReuseIdentifier: SpacerCell.reuseIdentifier)
    tableview.register(HeaderButtonsCell.self, forCellReuseIdentifier: HeaderButtonsCell.reuseIdentifier)
    tableview.register(HeaderJobSearchCell.self, forCellReuseIdentifier: HeaderJobSearchCell.reuseIdentifier)
  }
}

extension PremiumScreenView: UITableViewDelegate {}

extension PremiumScreenView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let model = models[indexPath.row] as? HeaderCellModel,
       let cell = tableView.dequeueReusableCell(
        withIdentifier: HeaderCell.reuseIdentifier,
        for: indexPath
       ) as? HeaderCell {
      cell.configure(
        image: model.avatar,
        setDefaultText: model.text,
        textFieldChange: model.textFieldChange,
        messageButtonAction: model.messageButtonAction
      )
      return cell
    } else if let model = models[indexPath.row] as? SeparatorCellModel,
              let cell = tableView.dequeueReusableCell(
                withIdentifier: SeparatorCell.reuseIdentifier,
                for: indexPath
              ) as? SeparatorCell {
      cell.configure(height: model.height)
      return cell
    } else if let model = models[indexPath.row] as? SpacerCellModel,
              let cell = tableView.dequeueReusableCell(
                withIdentifier: SpacerCell.reuseIdentifier,
                for: indexPath
              ) as? SpacerCell {
      cell.configure(height: model.height)
      return cell
    } else if let model = models[indexPath.row] as? HeaderButtonsCellModel,
              let cell = tableView.dequeueReusableCell(
                withIdentifier: HeaderButtonsCell.reuseIdentifier,
                for: indexPath
              ) as? HeaderButtonsCell {
      cell.configure(
        leftTitle: model.leftTitle,
        leftStyle: model.leftStyle,
        leftAction: model.centerAction,
        centerTitle: model.centerTitle,
        centerStyle: model.centerStyle,
        centerAction: model.centerAction,
        rightTitle: model.rightTitle,
        rightStyle: model.rightStyle,
        rightAction: model.rightAction
      )
      return cell
    } else if let model = models[indexPath.row] as? HeaderJobSearchModel,
              let cell = tableView.dequeueReusableCell(
                withIdentifier: HeaderJobSearchCell.reuseIdentifier,
                for: indexPath
              ) as? HeaderJobSearchCell {
      cell.configure(
        title: model.title,
        titleStyle: model.titleStyle,
        subtitle: model.subtitle,
        subtitleStyle: model.subtitleStyle,
        searchButtonTitle: model.searchButtonTitle,
        searchButtonStyle: model.searchButtonStyle,
        searchButtonAction: model.searchButtonAction
      )
      return cell
    }
    return UITableViewCell()
  }
}




