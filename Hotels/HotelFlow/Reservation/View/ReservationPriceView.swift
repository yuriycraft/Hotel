//
//  ReservationPriceView.swift
//  Hotels
//
//  Created by Lol Kek on 28/01/2024.
//

import SwiftUI

struct ReservationPriceView: View {
    let viewModel: HotelPriceViewModel

    var body: some View {
        let widthLhs = UIScreen.main.bounds.width / 2.3
        ZStack {
            CustomRoundedSpacer()
            VStack(spacing: LayoutConstants.padding16) {
                KeyValueView(key: viewModel.tourTitle,
                             value: viewModel.tourPriceFormatted,
                            rowWidth: widthLhs,
                            valueAlignment: .trailing)

                KeyValueView(key: viewModel.fuelChargeTitle,
                             value: viewModel.fuelChargeFormatted,
                            rowWidth: widthLhs,
                            valueAlignment: .trailing)

                KeyValueView(key: viewModel.serviseChargeTitle,
                             value: viewModel.serviceChargeFormatted,
                             rowWidth: widthLhs,
                            valueAlignment: .trailing)

                KeyValueView(key: viewModel.totalPriceTitle,
                             value: viewModel.totalPriceFormatted,
                            rowWidth: widthLhs,
                            valueAlignment: .trailing,
                            valueColor: ColorConstants.accentColor,
                            valueWeight: .semibold)
            }
            .padding()
        }
    }
}
