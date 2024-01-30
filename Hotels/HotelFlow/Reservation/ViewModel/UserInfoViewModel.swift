//
//  UserInfoViewModel.swift
//  Hotels
//
//  Created by Lol Kek on 27/01/2024.
//

import SwiftUI

class UserInfoViewModel: ObservableObject, Hashable {
    static func == (lhs: UserInfoViewModel, rhs: UserInfoViewModel) -> Bool {
        lhs.sectionTitle == rhs.sectionTitle
       }
       
       func hash(into hasher: inout Hasher) {
           hasher.combine(sectionTitle)
       }
    
    var sectionTitle: String

    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthDate: String = ""
    @Published var citizens: String = ""
    @Published var passNumber: String = ""
    @Published var passExpirationDate: String = ""

    @Published var isFirstNameValid: Bool = true
    @Published var isLastNameValid: Bool = true
    @Published var isBirthDateValid: Bool = true
    @Published var isCitizensValid: Bool = true
    @Published var isPassNumberValid: Bool = true
    @Published var isPassExpirationDateValid: Bool = true

    init(sectionTitle: String) {
        self.sectionTitle = sectionTitle
    }
    
    func validateFields() {
        isFirstNameValid = validateText(firstName)
        isLastNameValid = validateText(lastName)
        isBirthDateValid = validateText(birthDate)
        isCitizensValid = validateText(citizens)
        isPassNumberValid = validateText(passNumber)
        isPassExpirationDateValid = validateText(passExpirationDate)
    }

     func validateText(_ text: String) -> Bool {
        return text.count > 1
    }

    // MARK: - Check Validity of User Info
       func isDataValid() -> Bool {
           // Вызывайте методы проверки валидности для каждого поля пользователя
           validateFields()

           // Проверяем все флаги валидации и возвращаем результат
           return isFirstNameValid &&
                  isLastNameValid &&
                  isBirthDateValid &&
                  isCitizensValid &&
                  isPassNumberValid &&
                  isPassExpirationDateValid
       }
    let firstNameTitle = StringConstants.firstName
    let lastNameTitle = StringConstants.lastName
    let birthDateTitle = StringConstants.birthDate
    let citizensTitle = StringConstants.citizens
    let passNumberTitle = StringConstants.passNumber
    let passExpirationDateTitle = StringConstants.passExpirationDate
}
