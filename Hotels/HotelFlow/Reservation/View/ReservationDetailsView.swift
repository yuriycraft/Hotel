//
//  ReservationDetailView.swift
//  Hotels
//
//  Created by Lol Kek on 28/01/2024.
//

import SwiftUI

struct ReservationDetailsView: View {
    let viewModel: HotelPriceViewModel

    var body: some View {
        let widthLhs = UIScreen.main.bounds.width / 2.3

        ZStack {
            CustomRoundedSpacer()
            VStack(spacing: LayoutConstants.padding16) {
                KeyValueView(key: viewModel.departureTitle,
                             value: viewModel.departure,
                             rowWidth: widthLhs)
                KeyValueView(key: viewModel.arrivalCountryTitle,
                             value: viewModel.arrivalCountry,
                             rowWidth: widthLhs)
                KeyValueView(key: viewModel.tourDatesTitle,
                             value: viewModel.tourDatesFormatted,
                             rowWidth: widthLhs)
                KeyValueView(key: viewModel.numberOfNightsTitle,
                             value: viewModel.nightsCount,
                             rowWidth: widthLhs)
                KeyValueView(key: viewModel.hotelNameTitle,
                             value: viewModel.hotelName,
                             rowWidth: widthLhs)
                KeyValueView(key: viewModel.roomTitle,
                             value: viewModel.room,
                             rowWidth: widthLhs)
                KeyValueView(key: viewModel.nutritionTitle,
                             value: viewModel.nutrition,
                             rowWidth: widthLhs)
            }
            .padding()
        }
    }
}
