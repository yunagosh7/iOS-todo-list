//
//  TodoService.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 19/12/2024.
//

import Foundation

class TodoService {
    static var shared: TodoService = {
          let instance = TodoService()
          return instance
      }()

    
    
    func getAll() async throws -> [TodoModel] {
        let url = URL(string: "http://localhost:3000/api/v1/todo")
        let (data, response) = try await URLSession.shared.data(from: url!)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw TodoServiceErrors.apiError
        }
        
        do {
            let decoder = JSONDecoder()
            let res: GetAllResponseWrapper = try decoder.decode(GetAllResponseWrapper.self, from: data)
            print("items: \(res.todos ?? [])")
            return res.todos ?? []
        } catch TodoServiceErrors.dataType {
            throw TodoServiceErrors.dataType
        }
    }
    
    func create(_ todo: CreateTodoModel) async throws -> TodoModel {
        let url = URL(string: "http://localhost:3000/api/v1/todo")
        
        var urlRequest = URLRequest(url: url!)
     
        urlRequest.httpMethod = "POST"
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encodedBody = try JSONEncoder().encode(todo)
        
        
        let (data, response) = try await URLSession.shared.upload(for: urlRequest, from: encodedBody)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
            throw TodoServiceErrors.apiError
        }
        
        do {
            let dataDecoded = try JSONDecoder().decode(CreateResponseWrapper.self, from: data)
            return dataDecoded.todo
        } catch {
            throw TodoServiceErrors.dataType
        }
        
        
    }
    
    
    enum TodoServiceErrors : Error {
        case apiError
        case dataType
    }
}



extension TodoService: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
