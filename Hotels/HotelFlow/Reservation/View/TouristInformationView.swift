//
//  TouristInformationView.swift
//  Hotels
//
//  Created by Lol Kek on 28/01/2024.
//

import SwiftUI

struct TouristInformationView: View {
    @ObservedObject var viewModel: UserInfoViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: LayoutConstants.padding8) {
            ValidatedTextField(text: $viewModel.firstName,
                               title: viewModel.firstNameTitle,
                               isValid: $viewModel.isFirstNameValid) { text in
                viewModel.validateText(text)
            }

            ValidatedTextField(text: $viewModel.lastName,
                               title: viewModel.lastNameTitle,
                               isValid: $viewModel.isLastNameValid) { text in
                viewModel.validateText(text)
            }

            ValidatedTextField(text: $viewModel.birthDate,
                               title: viewModel.birthDateTitle,
                               keyboarType: .numberPad,
                               isValid: $viewModel.isBirthDateValid) { text in
                viewModel.validateText(text)
            }

            ValidatedTextField(text: $viewModel.citizens,
                               title: viewModel.citizensTitle,
                               isValid: $viewModel.isCitizensValid) { text in
                viewModel.validateText(text)
            }

            ValidatedTextField(text: $viewModel.passNumber,
                               title: viewModel.passNumberTitle,
                               isValid: $viewModel.isPassNumberValid) { text in
                viewModel.validateText(text)
            }

            ValidatedTextField(text: $viewModel.passExpirationDate,
                               title: viewModel.passExpirationDateTitle,
                               isValid: $viewModel.isPassExpirationDateValid) { text in
                viewModel.validateText(text)
            }
        }
        .padding(.horizontal)
        .padding(.top, 0)
        .padding(.bottom)
        .background(ColorConstants.background)
        .cornerRadius(LayoutConstants.cornerRadius12, corners: [.bottomLeft, .bottomRight])
    }
}
