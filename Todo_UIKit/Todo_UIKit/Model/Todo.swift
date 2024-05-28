//
//  Todo.swift
//  Todo_UIKit
//
//  Created by Chung Wussup on 5/24/24.
//

import Foundation

struct Todo: Codable {
    // John: uuid가 안쓰이고 있는데 빼도 되지않나요?
    var uuid = UUID()
    let title: String
    let content: String
    var date: Date = Date()
    var isCompleted: Bool
}
