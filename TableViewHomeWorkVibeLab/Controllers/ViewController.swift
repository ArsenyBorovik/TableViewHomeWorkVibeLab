//
//  ViewController.swift
//  TableViewHomeWorkVibeLab
//
//  Created by Арсений on 12/20/23.
//

import UIKit

class ViewController: UIViewController {
    
    enum TableSection {
        case main
        case secondary
    }
    
    /// Наш массив
    var friends: [Friend] = []
    /// Это для DiffableDataSource
    var dataSource: UITableViewDiffableDataSource<TableSection, Friend>?
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
        
        return table
    }()
    
    /// Заполнение массива, расстановка констрейнтов, сэтапы
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        friends = DataManager.shared.obtainFriends()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        setupNavigationBar()
        setupDataSource()
    }
    
    /// DiffableDataSource
    func setupDataSource() {
        
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, friend in
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseIdentifier, for: indexPath) as! CustomTableViewCell
            cell.configure(with: friend)
            
            return cell
        })
        updateFriends(with: friends)
    }
    
    /// DiffableDataSource
    /// - Parameter friends: struct
    func updateFriends(with friends: [Friend]) {
        var snapshot = NSDiffableDataSourceSnapshot<TableSection , Friend>()
        snapshot.appendSections([.main, .secondary])
        snapshot.appendItems(friends)
        dataSource?.apply(snapshot)
    }
    
    /// Навигация
    func setupNavigationBar() {
        let addAction = UIAction { _ in
            self.navigationController?.pushViewController(UserFormViewController(delegate: self), animated: true)
        }
        navigationItem.title = "Таблица"
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: addAction)
    }
}

extension ViewController: UserFormViewControllerDelegate {
    func updateFriends(with chel: Friend) {
        guard  var snapshot = self.dataSource?.snapshot() else {return}
        snapshot.appendItems([chel], toSection: .secondary)
        self.dataSource?.apply(snapshot)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        if let friend = dataSource?.itemIdentifier(for: indexPath) {
            navigationController?.pushViewController(DetailViewController(with: friend), animated: true)
        }
    }
}

