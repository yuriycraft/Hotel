//
//  SectionTappbleHeaderView.swift
//  Hotels
//
//  Created by Lol Kek on 28/01/2024.
//

import SwiftUI

struct SectionTappbleHeaderView: View {
    var title: String
    var isExpanded: Bool
    var isExpandable: Bool
    var onTap: () -> Void
    var image: ImageResource

    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .frame(alignment: .leading)
                .font(FontConstants.font22Medium)
                .foregroundColor(.primary)
            Spacer()
            if isExpandable {
                Image(image)
                    .rotationEffect(isExpanded ? Angle(degrees: 180) : .zero)
            } else {
                Image(image)
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(ColorConstants.background)
        .cornerRadius(LayoutConstants.cornerRadius12,
                      corners: isExpanded && isExpandable ? [.topLeft, .topRight] : .allCorners)
        .onTapGesture {
            onTap()
        }
    }
}
