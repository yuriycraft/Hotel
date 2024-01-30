//
//  priceInfoView.swift
//  Hotels
//
//  Created by Lol Kek on 15/01/2024.
//

import SwiftUI

struct PriceInfoView: View {
    var price: String
    var description: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: LayoutConstants.padding8) {
                Text(price)
                    .font(FontConstants.font30Medium)
                    .lineSpacing(36)
                
                Text(description)
                    .font(FontConstants.font16)
                    .foregroundColor(ColorConstants.primaryText)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
            }
        }
    }
}
