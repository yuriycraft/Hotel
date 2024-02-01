//
//  ReservationModel.swift
//  Hotels
//
//  Created by Lol Kek on 11/01/2024.
//

import Foundation

// MARK: - Reservation

struct Reservation: Codable {
    let id: Int
    let hotelName, hotelAdress: String
    let horating: Int
    let ratingName, departure, arrivalCountry, tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room, nutrition: String
    let tourPrice, fuelCharge, serviceCharge: Int
}
