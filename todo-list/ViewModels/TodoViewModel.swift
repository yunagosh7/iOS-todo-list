//
//  TodoViewModel.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 19/12/2024.
//

import Foundation

@MainActor
class TodoViewModel : ObservableObject {
    @Published var todos: [TodoModel] = []
    
    func getAll() async throws {
        do {
            let todosRes = try await TodoService.shared.getAll()
            print("Todos: \(todosRes)")
            todos = todosRes
        } catch {
            throw error
        }
    }
    
    func create(title: String, description: String) async throws {
        do {
            let todo = CreateTodoModel(title: title, description: description)
            let res = try await TodoService.shared.create(todo)
            todos.append(res)
        } catch {
            throw error
        }
       
    }

    
}
