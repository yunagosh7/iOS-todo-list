//
//  TodoModel.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 19/12/2024.
//

import Foundation


struct TodoModel : Codable, Identifiable {
    let timestamps: Timestamps?
    let description: String?
    let cardColor: String?
    let isCompleted: Bool?
    let _id: String?
    let title: String?
    let onDate: String?
    
    var id: String? { _id }
    
}


struct Timestamps : Codable {
    let completedOn: String?
    let createdOn: String?
    let modifiedOn: String?
}

struct CreateTodoModel: Encodable {
    let title: String?
    let description: String?
}
