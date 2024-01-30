//
//  HotelInfoView.swift
//  Hotels
//
//  Created by Lol Kek on 29/01/2024.
//

import SwiftUI

struct HotelInfoView: View {
    @ObservedObject var viewModel: HotelViewModel
    
    var body: some View {
        ZStack {
            CustomRoundedSpacer()
            
            VStack(alignment: .leading) {
                Text(viewModel.aboutHotelTitle)
                    .font(FontConstants.font22Medium)
                
                let infoData = viewModel.hotel?.aboutTheHotel?.peculiarities ?? []
                TrueTagView(tags: infoData)
                    .padding(.leading, -LayoutConstants.padding8)
                Text(viewModel.aboutHotelDescription)
                    .font(FontConstants.font16)
                    .padding(.top, -4)
                    .padding(.bottom, LayoutConstants.padding8)
                    .lineLimit(nil)
                VStack(alignment: .trailing, spacing: LayoutConstants.padding10) {
                    AmenityView(image: Image(viewModel.happyImageResource),
                                title: viewModel.happyTitle,
                                subtitle: viewModel.happySubtitle)
                    AmenityView(image: Image(viewModel.tickImageResource),
                                title: viewModel.tickTitle,
                                subtitle: viewModel.tickSubtitle)
                    AmenityView(image: Image(viewModel.closeImageResource),
                                title: viewModel.closeTitle,
                                subtitle: viewModel.closeSubtitle)
                }
                .padding()
                .background(ColorConstants.additionalBackground)
                .cornerRadius(LayoutConstants.cornerRadius15)
                .listRowSeparator(.visible)
            }.padding()
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
    }
}
