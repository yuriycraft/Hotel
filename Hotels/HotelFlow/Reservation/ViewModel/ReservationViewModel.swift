//
//  ReservationViewModel.swift
//  Hotels
//
//  Created by Lol Kek on 27/01/2024.
//

import Combine
import Foundation

enum TouristSectionTitle: String, CaseIterable {
    case first
    case second
    case third
    case fourth
    case fifth
    case sixth
    
    var localizedString: String {
        switch self {
        case .first: return StringConstants.first
        case .second: return StringConstants.second
        case .third: return StringConstants.third
        case .fourth: return StringConstants.fourth
        case .fifth: return StringConstants.fifth
        case .sixth: return StringConstants.sixth
        }
    }
}

class ReservationViewModel: ObservableObject {
    @Published var hotelPriceVM: HotelPriceViewModel? {
        didSet {
            objectWillChange.send()
        }
    }

    @Published var phone: String = ""
    @Published var phoneMask: String = "(***) **-**-***"
    @Published var email: String = ""
    @Published var isEmailValid: Bool = true
    @Published var isPhoneValid: Bool = true
    @Published var userInfoArray: [UserInfoViewModel] = []
    var calculatedPrice: String {
        "\(StringConstants.pay) \(String.formattedNumber(hotelPriceVM?.totalPrice ?? 0)) \(StringConstants.ruble)"
    }
    init() {
        addNewTourist()
        loadDataFromNetwork()
    }

    // MARK: - Load from Network

    private func loadDataFromNetwork() {
        APIClient
            .fetch(urlString: NetworkConstants.reservationUrlString) { (result: Result<Reservation, NetworkError>) in
            switch result {
            case .success(let reservationModel):
                DispatchQueue.main.async {
                    self.hotelPriceVM = HotelPriceViewModel(reservation: reservationModel)
                }
            case .failure(let error):
                print("Error loading reservation model: \(error)")
            }
        }
    }

    // MARK: - Add new tourist

    func addNewTourist() {
        guard userInfoArray.count < TouristSectionTitle.allCases.count else {
            return
        }

        let sectionTitle: TouristSectionTitle = nextAvailableSectionTitle()
        let newTourist = UserInfoViewModel(sectionTitle: sectionTitle.localizedString)
        userInfoArray.append(newTourist)
    }

    // MARK: - Check availible a section title

    private func nextAvailableSectionTitle() -> TouristSectionTitle {
        let usedSectionTitles = userInfoArray.map { $0.sectionTitle }
        for title in TouristSectionTitle.allCases where !usedSectionTitles.contains(title.localizedString) {
                return title
        }
        return TouristSectionTitle.first
    }

    // MARK: - Check Validity of All Data

    func firstInvalidUserInfoIndex() -> Int? {
        for (index, userInfo) in userInfoArray.enumerated() {
            guard !userInfo.isDataValid() else {
                continue
            }
            return index
        }

        return nil
    }

    // MARK: - Validation Methods

    func validatePhone() {
        isPhoneValid = phone.count == phoneMask.count
    }

    func validateEmail() {
        isEmailValid = email.isValidEmail
    }
    
}
