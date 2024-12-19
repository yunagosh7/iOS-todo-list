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
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField("Skere", text: $title)
                        .cornerRadius(10)
                        .frame(height: 32)
                        .padding(.horizontal, 16)
                        .background(.appGray)
                        .foregroundColor(.font)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .border(Color.accent, width: 3)
                        )
                    
                    TextField("Skere", text: $description)
                        .cornerRadius(10)
                        .frame(height: 32)
                        .padding(.horizontal, 16)
                        .background(.appGray)
                        .foregroundColor(.font)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .border(Color.accent, width: 3)
                        )
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .frame(width: 70,height: 75)
                .border(.accent, width: 3)
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 8)
        .background(.backgroundApp)
        
    }
}

#Preview {
    ContentView()
}
