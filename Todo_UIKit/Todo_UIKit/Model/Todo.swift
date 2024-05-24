//
//  Todo.swift
//  Todo_UIKit
//
//  Created by Chung Wussup on 5/24/24.
//

import Foundation

struct Todo: Codable {
    var uuid = UUID()
    let title: String
    let content: String
    var date: Date = Date()
    var isCompleted: Bool
}
