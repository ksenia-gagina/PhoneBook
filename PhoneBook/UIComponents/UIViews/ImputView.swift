//
//  ImputView.swift
//  PhoneBook
//
//  Created by Ксения Гагина on 19.02.2025.
//

import UIKit

public final class InputView: UIView {
  
  private let textfield = UITextField()
  
  // MARK: - Public properties
  
  public var textFieldChange: ((String) -> Void)?
  
  // MARK: - Init
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    setLayout()
    initial()
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Public funcs
  
  public func setText(_ value: String?) {
    textfield.text = value
  }
}

//MARK: - UITextFieldDelegate

extension InputView: UITextFieldDelegate {
  public func textField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool {
    // 1. Берём текущий текст или пустую строку, если он nil
    let currentText = textField.text ?? ""
    
    // 2. Преобразуем currentText в NSString, чтобы удобно заменить часть строки
    guard let textRange = Range(range, in: currentText) else { return true }
    
    // 3. Формируем новую строку с учётом введённого/удалённого символа
    let updatedText = currentText.replacingCharacters(in: textRange, with: string)
    
    textFieldChange?(updatedText)
    return true
  }
}

// MARK: - Private funcs

private extension InputView {
  func setLayout() {
    [textfield].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      self.heightAnchor.constraint(equalToConstant: Constants.imputHeight),
      
      textfield.leadingAnchor.constraint(equalTo: leadingAnchor),
      textfield.topAnchor.constraint(equalTo: topAnchor),
      textfield.trailingAnchor.constraint(equalTo: trailingAnchor),
      textfield.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  func initial() {
    textfield.borderStyle = .roundedRect
    textfield.backgroundColor = .systemGray.withAlphaComponent(0.3)
    textfield.delegate = self
  }
}

//MARK: - Constants

private enum Constants {
  static let imputHeight: CGFloat = 52
}
