//
//  TodosListViewController.swift
//  Todo_UIKit
//
//  Created by Chung Wussup on 5/24/24.
//

import UIKit


class TodosListViewController: UIViewController {
    
    private let viewModel = TodoListViewModel()
    
    private lazy var navAddButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, 
                                     target: self,
                                     action: #selector(didTapTodoAdd))
        
        return button
    }()
    
    private lazy var todoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodoTVCell.self, forCellReuseIdentifier: "TodoTVCell")
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.todoTableView.reloadData()
    }
    
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.title = "Todo List"
        self.navigationItem.rightBarButtonItem = navAddButton
        
        self.view.addSubview(todoTableView)
        NSLayoutConstraint.activate([
            todoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            todoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            todoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func didTapTodoAdd() {
        let addVC = AddTodoViewController()
        navigationController?.present(addVC, animated: true)
    }
    
}
extension TodosListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTVCell",
                                                    for: indexPath) as? TodoTVCell {
            
            cell.setupCell(todo: Todo(title: "사이틀", content: "컨텐츠",
                                      date: Date(), isCompleted: false))
            return cell
        }
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, 
                   forRowAt indexPath: IndexPath) {
        
    }
    
}
