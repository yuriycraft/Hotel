//
//  BuyerInfoView.swift
//  Hotels
//
//  Created by Lol Kek on 28/01/2024.
//

import SwiftUI

struct BuyerInfoView: View {
    static var identifier = "BuyerInfoView"

    @ObservedObject var viewModel: ReservationViewModel
    @State private var countryCode = "+7"
    var phoneNumberTitle: String
    var emailTitle: String

    var body: some View {
        ZStack {
            CustomRoundedSpacer()

            VStack(alignment: .leading, spacing: LayoutConstants.padding8) {
                ValidatedPhoneField(phoneNumber: $viewModel.phone,
                                    phoneCode: $countryCode,
                                    mask: $viewModel.phoneMask,
                                    title: phoneNumberTitle,
                                    isValid: $viewModel.isPhoneValid) { _ in
                    viewModel.validatePhone()
                    return viewModel.isPhoneValid
                }
                ValidatedTextField(text: $viewModel.email,
                                   title: emailTitle,
                                   keyboarType: .emailAddress,
                                   autocapitalization: .none,
                                   isValid: $viewModel.isEmailValid) { _ in
                    viewModel.validateEmail()
                    return viewModel.isEmailValid
                }

                Text(StringConstants.conditionDetails)
                    .padding(.top, LayoutConstants.padding8)
                    .font(FontConstants.font14)
                    .foregroundColor(ColorConstants.primaryText)
            }
            .padding()
        }
    }
}
