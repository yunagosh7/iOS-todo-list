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
    
    @Binding var dialogOpen: ContentView.Dialogs?
    
    @Binding var todoSelected: TodoModel?
    
    var body: some View {
        ZStack {
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
                        ZStack {
                            
                            Rectangle()
                                .background(.appGray)
                                .foregroundColor(.backgroundApp)
                                .border(.accent, width: 3)
                                .cornerRadius(4)
                            
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 16, height: 16)
                            
                        }}
                    .frame(width: 40,height: 40)
                    .padding(.leading, 40)
                    .background(.appGray)
                    .onTapGesture {
                        dialogOpen = .delete
                        todoSelected = todo
                    }
                    
                }
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .border(.accent, width: 3)
                .cornerRadius(8)
                .background(.appGray)
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
                        }
                        .frame(width: 40,height: 40)
                        .border(.accent, width: 3)
                        .padding(.leading, 12)
                        
                        
                        Button(action: {
                            Task {
                                
                            }
                        }) {
                            Image(systemName: "pencil")
                                .resizable()
                                .frame(width: 22, height: 22)
                        }
                        .frame(width: 40,height: 40)
                        .border(.accent, width: 3)
                        .padding(.leading, 12)
                    }
                }
            }
            
        }
        
    }
}


#Preview {
    @Previewable @State var open: Bool = false
    @Previewable @State var todoSelected: TodoModel? = nil
    @Previewable @State var dialogOpen: ContentView.Dialogs? = nil
    
    TodoCard(
        todo: TodoModel(
            description: "First task description lorem ipsum dolor sit amet", isCompleted: false, _id: "", title: "First Task"
        ),
        dialogOpen: $dialogOpen,
        todoSelected: $todoSelected
    )
}
