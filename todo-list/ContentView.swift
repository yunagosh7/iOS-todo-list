//
//  ContentView.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 13/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var title: String = ""
    @State var description: String = ""
    
    @State var loading: Bool = true
    
    @State var todoSelected: TodoModel? = nil
    
    @State var dialogOpen: Dialogs? = nil
    
    
    @StateObject var viewModel: TodoViewModel = TodoViewModel()
    
    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    VStack {
                        
                        TextField("Title...", text: $title, prompt: Text("Title...").foregroundColor(.font))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                            .background(.appGray)
                            .font(.system(size: 24))
                            .border(.accent, width: 3)
                        
                        TextField("Title...", text: $description, prompt: Text("About...").foregroundColor(.font))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                            .background(.appGray)
                            .font(.system(size: 24))
                            .border(.accent, width: 3)
                    }
                    .foregroundColor(.font)
                    
                    Button(action: {
                        Task {
                            do {
                                try await viewModel.create(title: title, description: description)
                                title = ""
                                description = ""
                            } catch {
                                print("Error creating item \(error)")
                            }
                        }
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    .frame(width: 85,height: 85)
                    .border(.accent, width: 3)
                    
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                
                if loading {
                    ProgressView().tint(.accent)
                } else {
                    if viewModel.todos.isEmpty {
                        Text("No tasks yet")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                    } else {
                        List(viewModel.todos) {todo in
                            TodoCard(todo: todo, dialogOpen: $dialogOpen, todoSelected: $todoSelected)
                                .listRowBackground(Color.backgroundApp)                    }
                        .listStyle(.plain)
                        .foregroundColor(.accentColor)
                    }
                }
                Spacer()
                
            }
            
            if todoSelected != nil {
                DeleteDialog(todo: $todoSelected)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 8)
        .background(.backgroundApp)
        .task {
            do {
                try await viewModel.getAll()
                loading = false
            } catch {
                print("Error getting all tasks: \(error)")
            }
        }
        
    }
    
    enum Dialogs {
        case delete
        
        case edit
    }
}

#Preview {
    ContentView()
}
