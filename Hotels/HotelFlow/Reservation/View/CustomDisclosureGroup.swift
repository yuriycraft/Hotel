//
//  CustomDisclosureGroup.swift
//  Hotels
//
//  Created by Lol Kek on 28/01/2024.
//

import SwiftUI

struct CustomDisclosureGroup<Prompt: View,
    ExpandedView: View>: View {
    @Binding var isExpanded: Bool
    var animation: Animation?

    let prompt: Prompt
    let expandedView: ExpandedView

    init(animation: Animation?,
         isExpanded: Binding<Bool>,
         prompt: () -> Prompt,
         expandedView: () -> ExpandedView) {
        self._isExpanded = isExpanded
        self.animation = animation
        self.prompt = prompt()
        self.expandedView = expandedView()
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                prompt
            }
        
            if isExpanded {
                expandedView
            }
        }
        .clipped()
        .contentShape(Rectangle())
    }
}
