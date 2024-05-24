//
//  AddTodoViewController.swift
//  Todo_UIKit
//
//  Created by Chung Wussup on 5/24/24.
//

import UIKit


protocol AddTodoDelegate {
    func sendSaveTodo(todo: Todo)
}

class AddTodoViewController: UIViewController {
    
    var delegate: AddTodoDelegate?
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "제목"
        return label
    }()
    
    private lazy var titleTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요."
        return textField
    }()
    
    private lazy var contenLabel: UILabel = {
       let label = UILabel()
        label.text = "내용"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var contentTextView: UITextView = {
       let textView = UITextView()
        textView.text = "내용을 입력하세요."
        textView.textColor = .lightGray
        return textView
    }()
    
    private lazy var todoAddButton: UIButton = {
       let button = UIButton()
        button.setTitle("등록", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI(){
        self.view.backgroundColor = .white
        
        [titleLabel, titleTextField, contenLabel, contentTextView, todoAddButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            titleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            contenLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            contenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contenLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            contentTextView.topAnchor.constraint(equalTo: contenLabel.bottomAnchor, constant: 10),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            
            todoAddButton.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 10),
            todoAddButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
    }
    

    
    @objc func tapAddButton() {
        guard let title = titleTextField.text else {
            return
        }
        guard let content = contentTextView.text else {
            return
        }
        
        if !title.isEmpty && !content.isEmpty {
            let todo = Todo(title: title, content: content)
            delegate?.sendSaveTodo(todo: todo)
            self.dismiss(animated: true)
        } else {
            if title.isEmpty {
                showAlert(isTitle: true)
            } else if content.isEmpty {
                showAlert(isTitle: false)
            }
        }

    }
    
    func showAlert(isTitle: Bool) {
        let title = isTitle ? "제목을 입력해주세요." : "내용을 입력해주세요."
        let message = "제목 및 내용을 입력하지 않았습니다."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }

}
