//
//  UserFormViewController.swift
//  TableViewHomeWorkVibeLab
//
//  Created by Арсений on 12/20/23.
//

import UIKit
import Foundation

/// Протокол для делегата
protocol UserFormViewControllerDelegate: AnyObject {
    func updateFriends(with chel: Friend)
}


class UserFormViewController: UIViewController {
    
    /// Делегат
    weak var delegate: UserFormViewControllerDelegate?
    
    /// Имя
    private lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Имя"
        textField.borderStyle = .line
        
        return textField
    }()
    
    /// Фамилия
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Фамилия"
        textField.borderStyle = .line
        
        return textField
    }()
    
    /// Возраст
    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Возраст"
        textField.borderStyle = .line
        
        return textField
    }()
    
    /// Пол
    private lazy var sexTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Пол"
        textField.borderStyle = .line
        
        return textField
    }()
    
    /// Место учёбы
    private lazy var schoolTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Место учёбы"
        textField.borderStyle = .line
        
        return textField
    }()
    
    /// Номер телефона
    private lazy var cellPhoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Телефон"
        textField.borderStyle = .line
        
        return textField
    }()
    
    /// Электронная почта
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Электронная почта"
        textField.borderStyle = .line
        
        return textField
    }()
    
    ///Заголовок экрана
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Анкета"
        label.font = .systemFont(ofSize: 32, weight: .black)
        
        return label
    }()
    
    /// Добавление нового друга
    private lazy var addButton: UIButton = {
        let action = UIAction { [self] _ in
            let newFriend = Friend(firstName: firstNameTextField.text ?? "-", lastName: lastNameTextField.text ?? "-", age: ageTextField.text ?? "-", sex: sexTextField.text ?? "-", school: schoolTextField.text ?? "-", cellPhoneNumber: cellPhoneNumberTextField.text ?? "-", email: emailTextField.text ?? "-")
            delegate?.updateFriends(with: newFriend)
            navigationController?.popViewController(animated: true)
        }
        
        let button = UIButton(configuration: .filled(), primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    init(delegate: UserFormViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setup()
        
    }
    
    /// Расставление UI 
    private func setup() {
        let stackView = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField, ageTextField, sexTextField, schoolTextField, cellPhoneNumberTextField, emailTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        view.addSubview(addButton)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12.5),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 250),
            addButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 75),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            addButton.widthAnchor.constraint(equalToConstant: 140),
        ])
    }
}
