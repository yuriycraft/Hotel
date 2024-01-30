//
//  TitleCellView.swift
//  Hotels
//
//
//

import SwiftUI

struct TitleCellView: View {
    let viewModel: HotelPriceViewModel
    var body: some View {
        ZStack {
            CustomRoundedSpacer()

            RatingView(rating: viewModel.rating,
                       title: viewModel.hotelName,
                       subtitle: viewModel.hotelAddress)

                .padding()
        }
    }
}
