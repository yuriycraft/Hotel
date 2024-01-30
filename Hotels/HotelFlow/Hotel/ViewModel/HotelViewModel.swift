//
//  HotelViewModel.swift
//  Hotels
//
//  Created by Lol Kek on 12/01/2024.
//

import Foundation
import SwiftUI

class HotelViewModel: ObservableObject {

    @Published var hotel: Hotel? {
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        loadDataFromNetwork()
    }
    
    // MARK: - Load from Network

     func loadDataFromNetwork() {
        APIClient.fetch(urlString: NetworkConstants.hotelUrlString) { (result: Result<Hotel, NetworkError>) in
            switch result {
            case .success(let hotelModel):
                DispatchQueue.main.async {
                    self.hotel = hotelModel
                }
            case .failure(let error):
                print("Error loading reservation model: \(error)")
            }
        }
    }
    
    var hotelAddress: String {
        guard let address = hotel?.address else { return "" }
        return address
    }
    
    var hotelName: String {
        guard let name = hotel?.name else { return "" }
        return name
    }
    
    var priceForIt: String {
        guard let priceForIt = hotel?.priceForIt else { return "" }
        return priceForIt.lowercased()
    }
    var formattedRating: String {
        guard let ratingName = hotel?.ratingName, let rating = hotel?.rating else { return "" }
        return "\(rating) \(ratingName)"
    }
    
    var formattedPrice: String {
        guard let minimalPrice = hotel?.minimalPrice
        else { return "" }
        return "от \(String.formattedNumber(minimalPrice)) ₽"
    }
    
    var aboutHotelDescription: String {
        return hotel?.aboutTheHotel?.description ?? ""
    }
    
    var imageUrls: [String] {
        return hotel?.imageUrls ?? []
    }
    
    var aboutHotelTitle: String {
        return StringConstants.aboutHotel
    }

    var happyImageResource: ImageResource {
        return ImageResource.happy
    }

    var happyTitle: String {
        return StringConstants.amenities
    }

    var happySubtitle: String {
        return StringConstants.mostNecessary
    }

    var tickImageResource: ImageResource {
        return ImageResource.tick
    }

    var tickTitle: String {
        return StringConstants.whatsIncluded
    }

    var tickSubtitle: String {
        return StringConstants.mostNecessary
    }

    var closeImageResource: ImageResource {
        return ImageResource.close
    }

    var closeTitle: String {
        return StringConstants.whatsNotIncluded
    }

    var closeSubtitle: String {
        return StringConstants.mostNecessary
    }
}
