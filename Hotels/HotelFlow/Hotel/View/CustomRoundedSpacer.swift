//
//  CustomRoundedSpacer.swift
//  Hotels
//
//  Created by Lol Kek on 29/01/2024.
//

import SwiftUI

struct CustomRoundedSpacer: View {
    var body: some View {
        Spacer()
            .background(ColorConstants.background)
            .padding(EdgeInsets())
            .clipped()
            .cornerRadius(LayoutConstants.cornerRadius12,
                          corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
    }
}

struct CustomBottomRoundedSpacer: View {
    var body: some View {
        Spacer()
            .background(ColorConstants.background)
            .padding(EdgeInsets())
            .clipped()
            .cornerRadius(LayoutConstants.cornerRadius12,
                          corners: [.bottomLeft, .bottomRight])
    }
}
