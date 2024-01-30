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
    let name, address: String?
    let minimalPrice: Int?
    let priceForIt: String?
    let rating: Int?
    let ratingName: String?
    let imageUrls: [String]?
    let aboutTheHotel: AboutTheHotel?

    enum CodingKeys: String, CodingKey {
        case id, name
        case address = "adress"
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

// MARK: - AboutTheHotel

struct AboutTheHotel: Codable {
    let description: String?
    let peculiarities: [String]?
}
