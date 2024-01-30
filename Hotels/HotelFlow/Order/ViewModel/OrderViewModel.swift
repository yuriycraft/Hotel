//
//  OrderViewModel.swift
//  Hotels
//
//  Created by Lol Kek on 29/01/2024.
//

import Foundation

class OrderViewModel: ObservableObject {
    var buttonText: String {
        StringConstants.superTitle
    }
    var confirmationText: String {
        String(format: StringConstants.confirmationText,
               generateSixDigitRandomNumber())
    }
    func generateSixDigitRandomNumber() -> String {
        let randomNumber = arc4random_uniform(900000) + 100000
        return String(randomNumber)
    }
}
