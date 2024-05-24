//
//  AddTodoViewController.swift
//  Todo_UIKit
//
//  Created by Chung Wussup on 5/24/24.
//

import UIKit


protocol AddTodoDelegate: AnyObject {
    func sendSaveTodo(todo: Todo)
}

class AddTodoViewController: UIViewController {
    
    weak var delegate: AddTodoDelegate?
    
    private let naviView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var naviCancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addAction(UIAction {[weak self] _ in
            self?.dismiss(animated: true)
        }
                         , for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "할 일"
        return label
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "할 일을 입력하세요."
        textField.delegate = self
        return textField
    }()
    
    private lazy var contenLabel: UILabel = {
        let label = UILabel()
        label.text = "내용"
        return label
    }()
    
    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.text = "내용을 입력하세요."
        textView.textColor = .lightGray
        textView.delegate = self
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
        
        [naviCancelButton, todoAddButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            naviView.addSubview($0)
        }
        
        [naviView, titleLabel, titleTextField, contenLabel, contentTextView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            naviView.topAnchor.constraint(equalTo: view.topAnchor),
            naviView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            naviView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            naviView.heightAnchor.constraint(equalToConstant: 44),
            
            titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: naviView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            titleTextField.topAnchor.constraint(equalTo: naviView.bottomAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            contenLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            contenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contenLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            contentTextView.topAnchor.constraint(equalTo: contenLabel.bottomAnchor, constant: 10),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ])
        
        
        NSLayoutConstraint.activate([
            naviCancelButton.centerYAnchor.constraint(equalTo: naviView.centerYAnchor),
            naviCancelButton.leadingAnchor.constraint(equalTo: naviView.leadingAnchor, constant: 16),
            
            todoAddButton.centerYAnchor.constraint(equalTo: naviView.centerYAnchor),
            todoAddButton.trailingAnchor.constraint(equalTo: naviView.trailingAnchor, constant: -16)
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
            let todo = Todo(title: title, content: content, isCompleted: false)
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
        let title = isTitle ? "할 일을 입력하세요." : "내용을 입력해주세요."
        let message = "할 일 및 내용을 입력하지 않았습니다."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension AddTodoViewController: UITextFieldDelegate {
    
}

extension AddTodoViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 입력하세요."
            textView.textColor = .lightGray
        }
    }
    
}
