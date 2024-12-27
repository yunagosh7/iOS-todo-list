//
//  TodoModel.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 19/12/2024.
//

import Foundation


struct TodoModel : Codable, Identifiable {
    let description: String?
    let isCompleted: Bool?
    let _id: String?
    let title: String?

    var id: String? { _id }
    
}



struct CreateTodoModel: Encodable {
    let title: String?
    let description: String?
}
