//
//  HotelModel.swift
//  HotelsTests
//
//  Created by Lol Kek on 11/01/2024.
//

import XCTest

class HotelModel: XCTestCase {
    // swiftlint:disable function_body_length
    func testHotelDecoding() {
        // Test Case 1
        var json = """
        {
            "id": 1,
            "name": "Example Hotel",
            "adress": "123 Main St",
            "minimal_price": 100,
            "price_for_it": "$100",
            "rating": 4,
            "rating_name": "Excellent",
            "image_urls": ["url1", "url2"],
            "about_the_hotel": {
                "description": "A great hotel",
                "peculiarities": ["P1", "P2"]
            }
        }
        """
        runHotelDecodingTest(with: json, expecting: 1)
        
        // Test Case 2
        // swiftlint:disable:next line_length
        json = """
        {
         "id": 2,
         "name": "Лучший пятизвездочный отель в Хургаде, Египет",
         "adress": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
         "minimal_price": 134268,
         "price_for_it": "За тур с перелётом",
         "rating": 5,
         "rating_name": "Превосходно",
         "image_urls": ["url1", "url2", "url3"],
         "about_the_hotel": {
            "description": "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
            "peculiarities": ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"]
          }
        }
        """
        runHotelDecodingTest(with: json, expecting: 2)

        // Test Case 3 - Missing Optional Values
        json = """
        {
            "id": 3,
            "name": "Simple Hotel",
            "adress": "789 Pine St",
            "minimal_price": 80,
            "price_for_it": "$80",
            "rating": 3,
            "image_urls": ["url1"]
        }
        """
        runHotelDecodingTest(with: json, expecting: 3)
        
        // Test Case 4 - Incorrect Data Types
        json = """
        {
            "id": "invalid",
            "name": 123,
            "adress": true,
            "minimal_price": "not_a_number",
            "price_for_it": 123,
            "rating": "high",
            "rating_name": 4,
            "image_urls": "invalid",
            "about_the_hotel": "not_an_object"
        }
        """
        runInvalidHotelDecodingTest(with: json)
        
        // Test Case 5 - Optional Values
        json = """
        {
            "id": 4,
            "name": "Optional Hotel",
            "adress": "456 Oak St",
            "minimal_price": 120,
            "price_for_it": "$120",
            "rating": 4,
            "rating_name": "Great",
            "image_urls": ["url1", "url2"],
            "about_the_hotel": null
        }
        """
        runHotelDecodingTest(with: json, expecting: 4)
        
        // Test Case 6 - Missing Values
        json = """
        {
            "id": 5,
            "minimal_price": 150,
            "price_for_it": "$150",
            "rating": 5,
            "rating_name": "Outstanding",
            "image_urls": ["url1", "url2"],
            "about_the_hotel": {
                "description": "Another great hotel",
                "peculiarities": ["P3", "P4"]
            }
        }
        """
        runHotelDecodingTest(with: json, expecting: 5)
    }
    
    private func runHotelDecodingTest(with json: String, expecting hotelID: Int) {
        // Act
        do {
            let hotel = try JSONDecoder().decode(Hotel.self, from: json.data(using: .utf8)!)
            
            // Assert
            XCTAssertEqual(hotel.id, hotelID)
            // Add more assertions based on your model properties
        } catch {
            XCTFail("Failed to decode Hotel with error: \(error)")
        }
    }
    
    private func runInvalidHotelDecodingTest(with json: String) {
        // Act & Assert
        XCTAssertThrowsError(try JSONDecoder().decode(Hotel.self, from: json.data(using: .utf8)!)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }
}
