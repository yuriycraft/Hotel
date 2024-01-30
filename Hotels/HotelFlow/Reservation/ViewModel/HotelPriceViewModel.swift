//
//  HotelPriceViewModel.swift
//  Hotels
//
//  Created by Lol Kek on 27/01/2024.
//

import SwiftUI

class HotelPriceViewModel: ObservableObject {
    let id: Int
    let hotelName: String
    let hotelAddress: String
    let rating: String
    let departure: String
    let arrivalCountry: String
    let tourStartDate: String
    let tourEndDate: String
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
    let totalPrice: Int
    var nightsCount: String = ""

    init(reservation: Reservation) {
        id = reservation.id
        hotelName = reservation.hotelName
        hotelAddress = reservation.hotelAdress
        rating = "\(reservation.horating) \(reservation.ratingName)"
        departure = reservation.departure
        arrivalCountry = reservation.arrivalCountry
        tourStartDate = reservation.tourDateStart
        tourEndDate = reservation.tourDateStop
        numberOfNights = reservation.numberOfNights
        room = reservation.room
        nutrition = reservation.nutrition
        tourPrice = reservation.tourPrice
        fuelCharge = reservation.fuelCharge
        serviceCharge = reservation.serviceCharge
        totalPrice = tourPrice + fuelCharge + serviceCharge
        nightsCount = "\(numberOfNights) \(StringConstants.nights)"
    }
    
    var tourPriceFormatted: String {
        "\(String.formattedNumber(tourPrice)) \(StringConstants.ruble)"
    }
    var fuelChargeFormatted: String {
        "\(String.formattedNumber(fuelCharge)) \(StringConstants.ruble)"
    }
    var serviceChargeFormatted: String {
        "\(String.formattedNumber(serviceCharge)) \(StringConstants.ruble)"
    }
    var totalPriceFormatted: String {
        "\(String.formattedNumber(totalPrice)) \(StringConstants.ruble)"
    }
    
    var tourDatesFormatted: String {
        "\(tourStartDate) – \(tourEndDate)"
    }
    
    let departureTitle: String = StringConstants.departure
    let arrivalCountryTitle: String = StringConstants.arrivalCountry
    let tourDatesTitle: String = StringConstants.tourDates
    let numberOfNightsTitle: String = StringConstants.numberOfNights
    let hotelNameTitle: String = StringConstants.hotelName
    let roomTitle = StringConstants.room
    let nutritionTitle = StringConstants.nutrition
    let tourTitle = StringConstants.tour
    let fuelChargeTitle = StringConstants.fuelCharge
    let serviseChargeTitle = StringConstants.serviseCharge
    let totalPriceTitle = StringConstants.totalPrice
}
