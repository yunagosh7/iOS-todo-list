//
//  RequestWrapper.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 23/12/2024.
//

import Foundation

struct ResponseWrapper : Decodable {
    let status: HttpStatus?
    let message: String?
    let todos: [TodoModel]?
    let todoCount: Int?
    
}

enum HttpStatus: String, Decodable {
    case success = "Success"
}
