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
    
    
    @StateObject var viewModel: TodoViewModel = TodoViewModel()
    
    var body: some View {
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
                .onTapGesture {
                    
                     
                    
                }
            }
            .padding(.top, 20)
            
            if viewModel.todos.isEmpty {
                Text("No tasks yet")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            } else {
                Text("You have tasks haha lol")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 8)
        .background(.backgroundApp)
        .task {
            do {
                try await viewModel.getAll()
            } catch {
                print("Error getting all tasks: \(error)")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
