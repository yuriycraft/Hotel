//
//  RoomsTests.swift
//  HotelsTests
//
//  Created by Lol Kek on 11/01/2024.
//
import XCTest

class RoomsTests: XCTestCase {

    func testRoomsDecoding() {
        // Test Case 1 - Valid JSON with all fields
        let json = """
        {
            "rooms": [
                {
                    "id": 1,
                    "name": "Single Room",
                    "price": 100,
                    "price_per": "$",
                    "peculiarities": ["P1", "P2"],
                    "image_urls": ["url1", "url2"]
                },
                {
                    "id": 2,
                    "name": "Double Room",
                    "price": 150,
                    "price_per": "$$",
                    "peculiarities": ["P3", "P4"],
                    "image_urls": ["url3", "url4"]
                }
            ]
        }
        """
        runRoomsDecodingTest(with: json)
    }

    func testRoomsDecodingWithMissingData() {
        // Test Case 2 - Missing Optional Values
        let json = """
        {
            "rooms": [
                {
                    "id": 3,
                    "name": "Suite",
                    "price": 200,
                    "peculiarities": ["P5", "P6"]
                },
                {
                    "id": 4,
                    "price": 120,
                    "peculiarities": ["P7", "P8"],
                    "image_urls": ["url5", "url6"]
                }
            ]
        }
        """
        runRoomsDecodingTest(with: json)
    }

    private func runRoomsDecodingTest(with json: String) {
        // Act
        do {
            let rooms = try JSONDecoder().decode(Rooms.self, from: json.data(using: .utf8)!)

            // Assert
            XCTAssertEqual(rooms.rooms?.count, 2)
            // Add more assertions based on your model properties

        } catch {
            XCTFail("Failed to decode Rooms with error: \(error)")
        }
    }

    // Add more tests if needed
}
