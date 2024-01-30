//
//  Constants.swift
//  Hotels
//
//  Created by Lol Kek on 29/01/2024.
//

import SwiftUI
enum StringConstants {
    static let pay = NSLocalizedString("pay", comment: "")
    static let conditionDetails = NSLocalizedString("conditionDetails", comment: "")
    static let phoneTitle = NSLocalizedString("phoneTitle", comment: "")
    static let emailTitle = NSLocalizedString("emailTitle", comment: "")
    static let addTouristTitle = NSLocalizedString("addTouristTitle", comment: "")
    static let goToSelectRoom = NSLocalizedString("goToSelectRoom", comment: "")
    static let imageLoadingError = NSLocalizedString("imageLoadingError", comment: "")
    static let selectRoom = NSLocalizedString("selectRoom", comment: "")
    static let departure = NSLocalizedString("departure", comment: "")
    static let arrivalCountry = NSLocalizedString("arrivalCountry", comment: "")
    static let tourDates = NSLocalizedString("tourDates", comment: "")
    static let numberOfNights = NSLocalizedString("numberOfNights", comment: "")
    static let hotelName = NSLocalizedString("hotelName", comment: "")
    static let room = NSLocalizedString("room", comment: "")
    static let nutrition = NSLocalizedString("nutrition", comment: "")
    static let nights = NSLocalizedString("nights", comment: "")
    static let tour = NSLocalizedString("tour", comment: "")
    static let fuelCharge = NSLocalizedString("fuelCharge", comment: "")
    static let serviseCharge = NSLocalizedString("serviseCharge", comment: "")
    static let totalPrice = NSLocalizedString("totalPrice", comment: "")
    static let ruble = NSLocalizedString("ruble", comment: "")
    static let firstName = NSLocalizedString("firstName", comment: "")
    static let lastName = NSLocalizedString("lastName", comment: "")
    static let birthDate = NSLocalizedString("birthDate", comment: "")
    static let citizens = NSLocalizedString("citizens", comment: "")
    static let passNumber = NSLocalizedString("passNumber", comment: "")
    static let passExpirationDate = NSLocalizedString("passExpirationDate", comment: "")
    static let first = NSLocalizedString("first", comment: "")
    static let second = NSLocalizedString("second", comment: "")
    static let third = NSLocalizedString("third", comment: "")
    static let fourth = NSLocalizedString("fourth", comment: "")
    static let fifth = NSLocalizedString("fifth", comment: "")
    static let sixth = NSLocalizedString("sixth", comment: "")
    static let mostNecessary = NSLocalizedString("mostNecessary", comment: "")
    static let whatsIncluded = NSLocalizedString("whatsIncluded", comment: "")
    static let whatsNotIncluded = NSLocalizedString("whatsNotIncluded", comment: "")
    static let amenities = NSLocalizedString("amenities", comment: "")
    static let aboutHotel = NSLocalizedString("aboutHotel", comment: "")
    static let confirmationText =  NSLocalizedString("confirmationText", comment: "")
    static let orderPaid = NSLocalizedString("orderPaid", comment: "")
    static let booking = NSLocalizedString("booking", comment: "")
    static let orderIsProcessed = NSLocalizedString("orderIsProcessed", comment: "")
    static let superTitle = NSLocalizedString("superTitle", comment: "")
}

enum FontConstants {
    static let font16 = Font.custom("SF Pro Display", size: 16)
    static let font16Medium = Font.custom("SF Pro Display", size: 16).weight(.medium)
    static let font22Medium = Font.custom("SF Pro Display", size: 22).weight(.medium)
    static let font14 = Font.custom("SF Pro Display", size: 14)
    static let font14Medium = Font.custom("SF Pro Display", size: 14).weight(.medium)
    static let font30Medium = Font.custom("SF Pro Display", size: 30).weight(.semibold)
}

enum ColorConstants {
    static let primaryText = Color(red: 0.51, green: 0.53, blue: 0.59)
    static let accentColor = Color(red: 0.05, green: 0.45, blue: 1)
    static let background = Color(UIColor.tertiarySystemBackground)
    static let textGray = Color(red: 0.66, green: 0.67, blue: 0.72)
    static let backgroundValid = Color(red: 0.96, green: 0.96, blue: 0.98)
    static let backgroundInvalid = Color(red: 0.92, green: 0.34, blue: 0.34, opacity: 0.15)
    static let textBlack = Color(red: 0.08, green: 0.08, blue: 0.17)
    static let ratingBackground = Color(red: 1, green: 0.78, blue: 0).opacity(0.20)
    static let ratingForeground = Color(red: 1, green: 0.66, blue: 0)
    static let additionalBackground = Color(red: 0.98, green: 0.98, blue: 0.99)
    static let amenityForeground = Color(red: 0.17, green: 0.19, blue: 0.21)
}

enum LayoutConstants {
    static let padding12: CGFloat = 12.0
    static let padding16: CGFloat = 16.0
    static let padding8: CGFloat = 8.0
    static let padding6: CGFloat = 6.0
    static let padding5: CGFloat = 5.0
    static let padding2: CGFloat = 2.0
    static let padding10: CGFloat = 10.0
    static let padding20: CGFloat = 20.0
    static let padding23: CGFloat = 23.0
    static let padding32: CGFloat = 32.0
    static let cornerRadius5: CGFloat = 5.0
    static let cornerRadius10: CGFloat = 10.0
    static let cornerRadius12: CGFloat = 12.0
    static let cornerRadius15: CGFloat = 15.0
    static let height44: CGFloat = 44.0
    static let height94: CGFloat = 94.0
}

enum DimensionConstants {
    static let keyOffset32: CGFloat = 32.0
    static let sectionHeaderHeight8: CGFloat = 8.0
    static let sectionFooterHeight0: CGFloat = 0.0
}

enum Spacing {
    static let small: CGFloat = 10
    static let large: CGFloat = 16
    static let extraSmall: CGFloat = 1
}

enum FontSize {
    static let small: CGFloat = 12
    static let regular: CGFloat = 16
    static let large: CGFloat = 17
}

enum VerticalPadding {
    static let small: CGFloat = Spacing.small
    static let large: CGFloat = Spacing.large
    static let extraSmall: CGFloat = Spacing.extraSmall
}

enum HorizontalPadding {
    static let large: CGFloat = Spacing.large
    // Добавьте другие значения, если необходимо
}

enum CustomFont {
    static let name = "SF Pro Display"
    static let sizeSmall: CGFloat = FontSize.small
    static let sizeRegular: CGFloat = FontSize.regular
    static let sizeLarge: CGFloat = FontSize.large
}

enum NextButtonConstants {
    static let buttonHeight: CGFloat = 48
    static let horizontalPadding: CGFloat = 16
    static let verticalPadding: CGFloat = 12
}
