//
//  DeleteDialog.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 25/12/2024.
//

import SwiftUI
import Foundation

struct DeleteDialog : View {
    
    @Binding var todo: TodoModel?
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .background(.dialogBackground)
                .opacity(0.65)
                
            
            VStack {
                Rectangle()
                    .frame(height: 6)
                    .foregroundColor(.darkOrange)
                    .padding(.bottom, 32)
                
                Text("Do you want to delete \(todo?.title ?? "Todo")")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                
                HStack {
                    Button("Yes", action: {
                        
                    })
                    .padding(8)
                    .frame(width: 84)
                    .border(.accent, width: 2)
                    .cornerRadius(5)
                    
                    Button("No", action: {
                        todo = nil
                    })
                    .padding(8)
                    .frame(width: 84)
                    .border(.accent, width: 2)
                    .cornerRadius(5)
                    
                }
                .padding(.bottom, 16)
            }
            .background(.appGray)
            .padding(.horizontal, 54)
        }
    }
}


#Preview {
    @Previewable @State var todo: TodoModel? = TodoModel( description: "Description", isCompleted: false, _id: "", title: "Title")
    DeleteDialog(todo: $todo)
}
