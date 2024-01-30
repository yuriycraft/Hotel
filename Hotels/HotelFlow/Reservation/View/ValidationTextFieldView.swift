//
//  ValidationTextFieldView.swift
//  Hotels
//
//  Created by Lol Kek on 26/01/2024.
//
import SwiftUI

struct ValidatedTextField: View {
    @FocusState private var isTextFieldFocused: Bool
    @Binding var text: String
    var title: String
    var keyboarType: UIKeyboardType = .default
    @Binding var isValid: Bool
    var validation: (String) -> Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                if !text.isEmpty {
                    Text(title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(ColorConstants.textGray)
                        .font(.custom(CustomFont.name, size: CustomFont.sizeSmall))
                        .opacity(text.isEmpty ? 0 : 1)
                        .padding(EdgeInsets())
                }

                TextField(title, text: $text)
                    .foregroundColor(.black)
                    .font(.custom(CustomFont.name, size: !text.isEmpty ? CustomFont.sizeRegular : CustomFont.sizeLarge))
                    .keyboardType(keyboarType)
                    .focused($isTextFieldFocused)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onChange(of: isTextFieldFocused,
                              perform: { isFocused in
                        if !isFocused {
                            isValid = validation(text)
                        }
                    })
            }
        }
        .padding(EdgeInsets(top: !text.isEmpty ? VerticalPadding.small : VerticalPadding.large,
                            leading: HorizontalPadding.large,
                            bottom: !text.isEmpty ? VerticalPadding.small : VerticalPadding.large,
                            trailing: HorizontalPadding.large))
        .background(isValid ? ColorConstants.backgroundValid : ColorConstants.backgroundInvalid)
        .cornerRadius(LayoutConstants.cornerRadius10)
    }
}

struct ValidatedPhoneField: View {
    @FocusState private var isTextFieldFocused: Bool
    @Binding var phoneNumber: String
    @Binding var phoneCode: String
    @Binding var mask: String

    var title: String
    var keyboarType: UIKeyboardType = .phonePad

    @Binding var isValid: Bool
    var validation: (String) -> Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    if !phoneNumber.isEmpty {
                        Text(title)
                            .font(.custom(CustomFont.name, size: CustomFont.sizeSmall))
                            .foregroundColor(ColorConstants.textGray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .opacity(phoneNumber.isEmpty ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: !phoneNumber.isEmpty ? VerticalPadding.small : VerticalPadding.large,
                                    leading: 0,
                                    bottom: VerticalPadding.extraSmall,
                                    trailing: 0))

                HStack(alignment: .center, spacing: 1) {
                    if phoneNumber.isEmpty && !isTextFieldFocused {
                        Text(title)
                            .font(.custom(CustomFont.name, size: CustomFont.sizeLarge))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .onTapGesture {
                                isTextFieldFocused = true
                            }
                    }
                    Text(phoneCode)
                        .foregroundColor(ColorConstants.textBlack)
                        .padding(.trailing, 2)
                        .font(.custom(CustomFont.name,
                                      size: phoneNumber.isEmpty
                                      ? CustomFont.sizeRegular : CustomFont.sizeLarge))
                        .opacity(isTextFieldFocused || phoneNumber.count > 0 ? 1 : 0)
                    Text(replaceWithAsterisks())

                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.custom(CustomFont.name,
                                      size: !phoneNumber.isEmpty
                                      ? CustomFont.sizeRegular : CustomFont.sizeLarge))
                        .tracking(3.5)
                        .multilineTextAlignment(.leading)
                        .opacity(isTextFieldFocused || phoneNumber.count > 0 ? 1 : 0)
                        .overlay(
                            TextField("", text: $phoneNumber)
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)
                                .font(.custom(CustomFont.name, size: phoneNumber.isEmpty ? CustomFont.sizeRegular : CustomFont.sizeLarge))
                                .foregroundColor(ColorConstants.textBlack)
                                .multilineTextAlignment(.leading)
                                .focused($isTextFieldFocused)
                                .onChange(of: phoneNumber) { newText in
                                    phoneNumber = newText
                                        .applyPatternOnNumbers(pattern: mask, replacmentCharacter: "*")
                                }
                                .onChange(of: isTextFieldFocused, perform: { isFocused in
                                    if !isFocused {
                                        isValid = validation(phoneNumber)
                                    }
                                })
                                .padding(EdgeInsets())
                        )
                }
                .padding(EdgeInsets(top: 0,
                                    leading: 0,
                                    bottom:!phoneNumber.isEmpty ? VerticalPadding.small : VerticalPadding.large,
                                    trailing: 0))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(EdgeInsets(top: 0,
                                leading: HorizontalPadding.large,
                                bottom: 0,
                                trailing: HorizontalPadding.large))
            .background(isValid ? ColorConstants.backgroundValid : ColorConstants.backgroundInvalid)
            .cornerRadius(LayoutConstants.cornerRadius10)
        }
        .padding(EdgeInsets())
    }

    private func replaceWithAsterisks() -> String {
        var result = ""
        var index = 0
        for char in mask {
            if (char == "*"
                || char == "("
                || char == " "
                || char == ")"
                || char == "-"
                || char == " ")
                && index < phoneNumber.count {
                result.append(" ")
                index += 1
            } else {
                result.append(char)
            }
        }
        return result
    }
}
