//
//  AmenityView.swift
//  Hotels
//
//  Created by Lol Kek on 17/01/2024.
//
import SwiftUI

struct AmenityView: View {
    var image: Image
    var title: String
    var subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: LayoutConstants.padding12) {
                image
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)

                VStack(alignment: .leading,
                       spacing: LayoutConstants.padding2) {
                    Text(title)
                        .font(FontConstants.font16Medium)
                        .foregroundColor(ColorConstants.amenityForeground)

                    Text(subtitle)
                        .font(FontConstants.font14Medium)
                        .foregroundColor(ColorConstants.primaryText)
                }

                Spacer()
                Image(ImageResource.blackDisclosure)
                    .foregroundColor(.black)
            }
            .frame(minWidth: 0, maxWidth: .infinity,
                   alignment: .leading)
            .contentShape(Rectangle())

            .padding(EdgeInsets(top: LayoutConstants.padding6,
                                leading: LayoutConstants.padding10,
                                bottom: LayoutConstants.padding6,
                                trailing: LayoutConstants.padding8))
            .listRowInsets(EdgeInsets())
            Divider().background(ColorConstants.primaryText.opacity(0.15))
                .padding(.leading, 46)
                .padding(.trailing, LayoutConstants.padding8)
        }
    }
}
