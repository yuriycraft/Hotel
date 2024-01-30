//
//  HotelHeaderView.swift
//  Hotels
//
//  Created by Lol Kek on 15/01/2024.
//

import SwiftUI

struct RatingView: View {
    let rating: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: LayoutConstants.padding5) {
                Image(ImageResource.star)
                    .frame(width: 15, height: 15)
                
                Text(rating)
                    .font(FontConstants.font16Medium)
                    .foregroundColor(ColorConstants.ratingForeground)
            }
            .padding(EdgeInsets(top: LayoutConstants.padding5,
                                leading: LayoutConstants.padding10,
                                bottom: LayoutConstants.padding5,
                                trailing: LayoutConstants.padding10))
            .frame(minHeight: 29)
            .background(ColorConstants.ratingBackground)
            .cornerRadius(LayoutConstants.cornerRadius5)
            
            VStack(alignment: .leading, spacing: LayoutConstants.padding8) {
                Text(title)
                    .font(FontConstants.font22Medium)
                    .padding(.top, LayoutConstants.padding8)
                
                Text(subtitle)
                    .font(FontConstants.font14Medium)
                    .foregroundColor(ColorConstants.accentColor)
                    .padding(.top, LayoutConstants.padding8)
            }
        }
    }
}
