//
//  TodoService.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 19/12/2024.
//

import Foundation

class TodoService {
    
    
    func getAll() async throws -> [TodoModel] {
        let url = URL(string: "http://localhost:3000/api/v1")
        let (data, response) = try await URLSession.shared.data(from: url!)
        
        guard let response = response as? HTTPURLResponse, response.statusCode != 200 else {
            throw TodoServiceErrors.apiError
        }
        
        do {
            let decoder = JSONDecoder()
            let posts: [TodoModel] = try decoder.decode([TodoModel].self, from: data)
            return posts
        } catch TodoServiceErrors.dataType {
            throw TodoServiceErrors.dataType
        }
    }
    
    func create(todo: TodoModel) async throws {
        let url = URL(string: "http://localhost:3000/api/v1")
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        
        let encodedBody = try JSONEncoder().encode(todo)
        
        
        let (data, response) = try await URLSession.shared.upload(for: urlRequest, from: encodedBody)
        
        
        
    }
    
    
    enum TodoServiceErrors : Error {
        case apiError
        case dataType
    }
}


