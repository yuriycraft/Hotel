//
//  View+BackButtonClearTitle.swift
//  Hotels
//
//  Created by Lol Kek on 15/01/2024.
//

import SwiftUI

extension View {
    func navigationBarBackButtonTitleHidden() -> some View {
        self.modifier(NavigationBarBackButtonModifier())
    }
}

struct NavigationBarBackButtonModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @ViewBuilder @MainActor func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {
                    self.dismiss()
                }) {
                    Image(ImageResource.back)
                        .foregroundColor(colorScheme == .dark ? .white : .black )
                        .imageScale(.large)
                })
            .contentShape(Rectangle())
            .gesture(
                DragGesture(coordinateSpace: .local)
                    .onEnded { value in
                        if value.translation.width > .zero,
                           value.translation.height > -30,
                           value.translation.height < 30 {
                            self.dismiss()
                        }
                    }
            )
    }
}
