//
//  DetailViewController.swift
//  TableViewHomeWorkVibeLab
//
//  Created by Арсений on 12/20/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    /// Имя
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Фамилия
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Возраст
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Пол
    private lazy var sexLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Место учёбы
    private lazy var schoolLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Номер телефона
    private lazy var cellPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Почта
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 1
        
        return label
    }()
    
    /// Заголовок экрана
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Детальный экран"
        label.font = .systemFont(ofSize: 32, weight: .black)
        
        return label
    }()
    
    /// Инициализатор
    /// - Parameter friend: struct
    init(with friend: Friend) {
        super.init(nibName: nil, bundle: nil)
        firstNameLabel.text = friend.firstName
        lastNameLabel.text = friend.lastName
        ageLabel.text = friend.age
        sexLabel.text = friend.sex
        schoolLabel.text = friend.school
        cellPhoneNumberLabel.text = friend.cellPhoneNumber
        emailLabel.text = friend.email
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setup()
    }
    
    /// Расстановка UI
    func setup() {
        let mainStack = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel, ageLabel, sexLabel, schoolLabel, cellPhoneNumberLabel, emailLabel])
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        view.addSubview(mainStack)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStack.widthAnchor.constraint(equalToConstant: 250),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12.5)
        ])
    }

}
