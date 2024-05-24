//
//  TodoListViewModel.swift
//  Todo_UIKit
//
//  Created by Chung Wussup on 5/24/24.
//

import Foundation


class TodoListViewModel {
    
    private(set) var todos: [Todo] = [] {
        didSet {
            saveTodos()
        }
    }
    
    func add(todo: Todo) {
        todos.append(todo)
    }
    
    func delete(at index: Int) {
        todos.remove(at: index)
    }
    
    func toggleComplete(at index: Int) {
        todos[index].isCompleted.toggle()
    }
    
    func loadTodos(completion: @escaping() -> Void) {
        if let data = UserDefaults.standard.data(forKey: "todos"),
           let savedTodos = try? JSONDecoder().decode([Todo].self, from: data) {
            todos = savedTodos.sorted(by: { before, after in
                if before.isCompleted == after.isCompleted {
                    return before.date > after.date
                } else {
                    return !before.isCompleted && after.isCompleted
                }
            })
            
            completion()
        }
    }
    
    private func saveTodos() {
        if let data = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(data, forKey: "todos")
        }
    }
    
}
