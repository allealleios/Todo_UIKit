//
//  TodoListViewModel.swift
//  Todo_UIKit
//
//  Created by Chung Wussup on 5/24/24.
//

import Foundation


class TodoListViewModel {
    
    var todos: [Todo] = [] {
        didSet {
            saveTodo()
        }
    }
    
    func saveTodo() {
        
    }
    
}
