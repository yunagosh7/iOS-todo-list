//
//  Placeholder.swift
//  todo-list
//
//  Created by Juan Cruz Vila on 23/12/2024.
//

import Foundation
import SwiftUICore

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
