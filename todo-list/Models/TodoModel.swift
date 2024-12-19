//
//  TodoModel.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 19/12/2024.
//

import Foundation


struct TodoModel : Codable {
    let timestamps: Timestamps
    let description: String
    let cardColor: String
    let isCompleted: Bool
    let _id: String
    let title: String
    let onDate: Date
}


struct Timestamps : Codable {
    let completedOn: Date
    let createdOn: Date
    let modifiedOn: Date
}
