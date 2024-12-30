//
//  DeleteDialog.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 25/12/2024.
//

import SwiftUI
import Foundation

struct DeleteDialog : View {
    @ObservedObject var viewModel: TodoViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .background(.dialogBackground)
                .opacity(0.65)
                .onTapGesture {
                    viewModel.closeDialog()
                }
                
            
            VStack {
                Rectangle()
                    .frame(height: 6)
                    .foregroundColor(.darkOrange)
                    .padding(.bottom, 32)
                
                Text("Do you want to delete \(viewModel.todoSelected?.title ?? "Todo")")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                
                HStack {
                    Button("Yes", action: {
                        Task {
                            
                            try await viewModel.deleteOne(todoId: viewModel.todoSelected?._id ?? "")
                            viewModel.closeDialog()
                        }
                    })
                    .padding(8)
                    .frame(width: 84)
                    .cornerRadius(5)
                    .overlay() {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.accent, lineWidth: 2)
                    }
                    
                    Button("No", action: {
                        viewModel.closeDialog()
                    })
                    .padding(8)
                    .frame(width: 84)
                    .cornerRadius(5)
                    .overlay() {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.accent, lineWidth: 2)
                    }
                    
                }
                .padding(.bottom, 16)
            }
            .background(.appGray)
            .padding(.horizontal, 54)
        }
    }
}


#Preview {
    @Previewable @StateObject var viewModel: TodoViewModel = TodoViewModel()
    @Previewable @State var todo: TodoModel? = TodoModel( description: "Description", isCompleted: false, _id: "", title: "Title")
    
    DeleteDialog(viewModel: viewModel)
}
