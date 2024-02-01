//
//  HotelHeaderView.swift
//  Hotels
//
//  Created by Lol Kek on 29/01/2024.
//

import SwiftUI

struct HotelHeaderView: View {
    @ObservedObject var viewModel: HotelViewModel

    var body: some View {
        ZStack {
            CustomBottomRoundedSpacer()
            
            VStack(alignment: .leading) {
                PageView(urlArray: viewModel.imageUrls)
                    .frame(maxWidth: .infinity, minHeight: 257, maxHeight: 257)
                   
                
                RatingView(rating: viewModel.formattedRating,
                           title: viewModel.hotelName,
                           subtitle: viewModel.hotelAddress)
                    .padding(.top, LayoutConstants.padding8)
                
                PriceInfoView(price: viewModel.formattedPrice,
                              description: viewModel.priceForIt)
                    .padding(.top, LayoutConstants.padding8)
            }
            .padding()
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
    }
}
