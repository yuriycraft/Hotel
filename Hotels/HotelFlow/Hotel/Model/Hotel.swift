//
//  HotelModel.swift
//  Hotels
//
//  Created by Lol Kek on 11/01/2024.
//

import Foundation

// MARK: - Hotel

struct Hotel: Codable {
    let id: Int?
    let name, adress: String?
    let minimalPrice: Int?
    let priceForIt: String?
    let rating: Int?
    let ratingName: String?
    let imageUrls: [String]?
    let aboutTheHotel: AboutTheHotel?
}

// MARK: - AboutTheHotel

struct AboutTheHotel: Codable {
    let description: String?
    let peculiarities: [String]?
}
