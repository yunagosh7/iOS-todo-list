//
//  RequestWrapper.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 23/12/2024.
//

import Foundation

struct CreateResponseWrapper : Decodable {
    var status: HttpStatus
    var message: String
    var todo: TodoModel
}

struct GetAllResponseWrapper : Decodable {
    var status: HttpStatus
    var message: String
    var todos: [TodoModel]
    let todoCount: Int
}

struct DeleteResponseWrapper : Decodable {
    var status: HttpStatus
    var message: String
}

struct UpdateResponseWrapper : Decodable {
    var status: HttpStatus
    var message: String
}

enum HttpStatus: String, Decodable {
    case success = "Success"
    case dbError = "Error"
}
