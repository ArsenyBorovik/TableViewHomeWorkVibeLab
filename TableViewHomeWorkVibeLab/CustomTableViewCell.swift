//
//  CustomTableViewCell.swift
//  TableViewHomeWorkVibeLab
//
//  Created by Арсений on 12/20/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    /// Имя
    lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Возраст
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Метод для сборки
    /// - Parameter friend: моделька
    func configure(with friend: Friend) {
        firstNameLabel.text = "Имя: \(friend.firstName)"
        ageLabel.text = "Возраст: \(String(friend.age))"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Расстановка UI
    private func setup() {
        let mainStack = UIStackView(arrangedSubviews: [firstNameLabel, ageLabel])
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        contentView.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
