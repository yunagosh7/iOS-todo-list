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
    
    @Published var dialogOpen: Dialogs? = nil
    
    @Published var todoSelected: TodoModel? = nil
    
    
    func getAll() async throws -> Void {
        do {
            let todosRes = try await TodoService.shared.getAll()
            print("Todos: \(todosRes.count)")
            todos = todosRes
            
        } catch {
            throw error
        }
    }
    
    func create(title: String, description: String) async throws -> Void {
        do {
            let todo = CreateTodoModel(title: title, description: description)
            let res = try await TodoService.shared.create(todo)
            todos.append(res)
        } catch {
            throw error
        }
        
    }
    
    func deleteOne(todoId: String) async throws -> Void {
        do {
            try await TodoService.shared.deleteOne(todoId)
            self.todos = todos.filter { todo in
                return todo._id != todoId
            }
            print("items number: \(self.todos.count)")
        } catch {
            throw error
        }
    }
    
    
    func openDialog(todo: TodoModel, dialog: Dialogs) -> Void {
        self.dialogOpen = dialog
        self.todoSelected = todo
    }
    
    func closeDialog() -> Void {
        self.dialogOpen = nil
        self.todoSelected = nil
    }
    
    enum Dialogs {
        case delete
        
        case edit
    }
}
