//
//  KeyValueView.swift
//  Hotels
//
//  Created by Lol Kek on 28/01/2024.
//

import SwiftUI

struct KeyValueView: View {
    var key: String
    var value: String
    var rowWidth: CGFloat
    var keyAlignment: Alignment = .leading
    var valueAlignment: Alignment = .leading
    var valueColor: Color = .primary
    var valueWeight: Font.Weight = .regular

    var body: some View {
        HStack(spacing: LayoutConstants.padding16) {
            let customOffset = DimensionConstants.keyOffset32
            Text(key)
                .font(FontConstants.font16)
                .foregroundColor(ColorConstants.primaryText)
                .frame(width: rowWidth - customOffset, alignment: keyAlignment)
                .fixedSize(horizontal: true, vertical: true)

            Text(value)
                .font(FontConstants.font16)
                .fontWeight(valueWeight)
                .frame(width: rowWidth + customOffset, alignment: valueAlignment)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundColor(valueColor)
        }
    }
}
