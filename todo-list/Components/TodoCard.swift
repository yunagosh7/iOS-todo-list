//
//  TodoCard.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 24/12/2024.
//

import Foundation
import SwiftUI

struct TodoCard : View {
    @State var selected: Bool = false
    
    let todo: TodoModel
    
    @ObservedObject var viewModel: TodoViewModel
    
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(todo.title ?? "")
                        .font(.system(size: 32))
                        .foregroundColor(.font)
                        .padding(.bottom, 4)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    
                    Text(todo.description ?? "")
                        .font(.system(size: 24))
                        .foregroundColor(.font)
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                
                Button(action: {
                }) {
                    
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                }
                
                
                .frame(width: 40,height: 40)
                .background(.backgroundApp)
                .cornerRadius(8)
                .overlay() {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.accent, lineWidth: 3)
                }
                .padding(.leading, 40)
                .onTapGesture {
                    viewModel.openDialog(todo: todo, dialog: .delete)
                }
                
            }
            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
            .background(.appGray)
            .cornerRadius(8)
            .overlay() {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.accent, lineWidth: 3)
            }
            .onTapGesture {
                selected = !selected
            }
            
            if selected {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        Task {
                            
                        }
                    }) {
                        Image(systemName: "info")
                            .resizable()
                            .frame(width: 12, height: 22)
                            .foregroundColor(.font)
                    }
                    .frame(width: 40,height: 40)
                    .background(.appGray)
                    .cornerRadius(8)
                    .overlay() {
                        RoundedRectangle( cornerRadius: 8)
                            .stroke(.accent, lineWidth: 2)
                        
                    }
                    .padding(.leading, 12)
                    
                    Button(action: {
                        Task {
                            do {
                                var updatedTodo = todo
                                updatedTodo.isCompleted = !updatedTodo.isCompleted
                                try await viewModel.updateTodo(updatedTodo: updatedTodo)
                            } catch {
                                print("Erorr updating \(error)")
                            }
                        }
                    }) {
                        if todo.isCompleted {
                            
                            Image(systemName: "checkmark.square.fill")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(.font)
                        } else {
                            
                            Image(systemName: "square")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(.font)
                        }
                        
                    }
                    .frame(width: 40,height: 40)
                    .background(.appGray)
                    .cornerRadius(8)
                    .overlay() {
                        RoundedRectangle( cornerRadius: 8)
                            .stroke(.accent, lineWidth: 2)
                        
                    }
                    .padding(.leading, 4)
                }
            }
        }
        
        
    }
}


#Preview {
    @Previewable @State var open: Bool = false
    @Previewable @State var todoSelected: TodoModel? = nil
    @Previewable @StateObject var viewModel: TodoViewModel = TodoViewModel()
    
    TodoCard(
        todo: TodoModel(
            description: "First task description lorem ipsum dolor sit amet", isCompleted: false, _id: "", title: "First Task"
        ),
        viewModel: viewModel
    )
}
