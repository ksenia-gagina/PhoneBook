//
//  MainScreenView.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 25.01.2025.
//

import UIKit

final class MainScreenView: UIView {
  
  // MARK: - Private propertes
  
  private let tableView = UITableView()
  private let contacts: [Contact] = [
    Contact(firstName: "Иван", lastName: "Иванов", phoneNumber: "+7 123 456 78 90"),
    Contact(firstName: "Мария", lastName: "Петрова", phoneNumber: "+7 987 654 32 10"),
    Contact(firstName: "Анна", lastName: "Смирнова", phoneNumber: "+7 555 444 33 22"),
    Contact(firstName: "Сергей", lastName: "Кузнецов", phoneNumber: "+7 111 222 33 44"),
    Contact(firstName: "Ольга", lastName: "Михайлова", phoneNumber: "+7 999 888 77 66"),
    Contact(firstName: "Алексей", lastName: "Федоров", phoneNumber: "+7 777 666 55 44"),
    Contact(firstName: "Елена", lastName: "Соколова", phoneNumber: "+7 333 222 11 00"),
    Contact(firstName: "Дмитрий", lastName: "Васильев", phoneNumber: "+7 888 777 66 55"),
    Contact(firstName: "Татьяна", lastName: "Павлова", phoneNumber: "+7 444 555 66 77"),
    Contact(firstName: "Николай", lastName: "Семенов", phoneNumber: "+7 222 333 44 55")
  ]
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    initialize()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UITableViewDelegate

extension MainScreenView: UITableViewDelegate { }

// MARK: - UITableViewDataSource

extension MainScreenView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    contacts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: TitleAndSubtitleTableCellView.reuseIdentifier,
      for: indexPath
    ) as! TitleAndSubtitleTableCellView
    cell.configure(with: contacts[indexPath.row])
    return cell
    
  }
}

// MARK: - Private funcs

private extension MainScreenView {
  func initialize() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(
      TitleAndSubtitleTableCellView.self,
      forCellReuseIdentifier: TitleAndSubtitleTableCellView.reuseIdentifier
    )
  }
  
  func setLayout() {
    [tableView].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: topAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
    ])
  }
}
