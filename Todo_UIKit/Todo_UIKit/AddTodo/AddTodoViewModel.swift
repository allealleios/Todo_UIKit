//
//  AddTodoViewModel.swift
//  Todo_UIKit
//
//  Created by Chung Wussup on 5/27/24.
//

import Foundation

class AddTodoViewModel {
    var title: String = "" {
        didSet {
            validateInput()
        }
    }
    
    var content: String = "" {
        didSet {
            validateInput()
        }
    }
    
    var isAddButtonEnabled: ((Bool) -> Void)?
    var showAlert: ((String, String) -> Void)?
    var didSaveTodo: ((Todo) -> Void)?
    
    // John: AddTodo뷰컨에 textViewDidEndEditing 함수랑 중복인거 같아요
    private func validateInput() {
        let isTitleEmpty = title.isEmpty
        let isContentEmpty = content.isEmpty || content == "내용을 입력하세요."
        isAddButtonEnabled?(!isTitleEmpty && !isContentEmpty)
    }
    
    // John: 이건 언제 사용되는 함수에요?
    func saveTodo() {
        guard !title.isEmpty, !content.isEmpty else {
            if title.isEmpty {
                showAlert?("할 일을 입력하세요.", "할 일을 입력하지 않았습니다.")
            } else {
                showAlert?("내용을 입력해주세요.", "내용을 입력하지 않았습니다.")
            }
            return
        }
        
        let todo = Todo(title: title, content: content, isCompleted: false)
        didSaveTodo?(todo)
    }
    
}

