//
//  HotelCoordinator.swift
//  Hotels
//
//  Created by Lol Kek on 11/01/2024.
//

import Combine
import SwiftUI

enum HotelPage: String, Identifiable {
    case hotel,
         rooms,
         reservation,
         order
    
    var id: String {
        rawValue
    }
}

final class HotelFlowCoordinator: ObservableObject, Hashable {
    @Published var page: HotelPage
    private var id: UUID
    private var cancellables = Set<AnyCancellable>()
    private var previousTitle: String?
    
    let pushCoordinator = PassthroughSubject<HotelFlowCoordinator?, Never>()
    
    fileprivate init(page: HotelPage, title: String?) {
        id = UUID()
        self.page = page
        self.previousTitle = title
    }
    
    init(page: HotelPage) {
        id = UUID()
        self.page = page
    }
    
    @ViewBuilder
    func build() -> some View {
        switch page {
        case .hotel:
            hotelView()
                .navigationBarTitle(StringConstants.hotelName)
                .navigationBarTitleDisplayMode(.inline)
        case .rooms:
            roomsView()
                .navigationBarTitle(previousTitle ?? StringConstants.selectRoom)
                .navigationBarTitleDisplayMode(.inline)
        case .reservation:
            reservationView()
                .navigationBarTitle(StringConstants.booking)
                .navigationBarTitleDisplayMode(.inline)
        case .order:
            orderView()
                .navigationBarTitle(StringConstants.orderPaid)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: Required methods for class to conform to Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: HotelFlowCoordinator, rhs: HotelFlowCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: View Creation Methods

    private func hotelView() -> some View {
        let viewModel = HotelViewModel()
        let hotelView = HotelView(viewModel: viewModel)
        bind(view: hotelView)
           
        return hotelView
    }
    
    private func roomsView() -> some View {
        let viewModel = RoomsViewModel()
        let roomsView = RoomsView(viewModel: viewModel)
        bind(view: roomsView)
        return roomsView
    }
    
    private func reservationView() -> some View {
        let viewModel = ReservationViewModel()
        let reservationView = ReservationView(reservationVM: viewModel)
        bind(view: reservationView)
        return reservationView
    }
    
    private func orderView() -> some View {
        let viewModel = OrderViewModel()
        let orderView = OrderView(viewModel: viewModel)
        bind(view: orderView)
        return orderView
    }
    
    // MARK: View Bindings

    private func bind(view: HotelView) {
        view.didClickMenuItem
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] title in
                self?.previousTitle = title
                self?.showRooms()
            })
            .store(in: &cancellables)
    }
    
    private func bind(view: RoomsView) {
        view.didClickRoomItem
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.showReservation()
            })
            .store(in: &cancellables)
    }
    
    private func bind(view: ReservationView) {
        view.didClickReservationItem
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.showOrder()
            })
            .store(in: &cancellables)
    }
    
    private func bind(view: OrderView) {
        view.didClickOrderItem
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.popToRoot()
            })
            .store(in: &cancellables)
    }
}

// MARK: Navigation Related Extensions

extension HotelFlowCoordinator {
    private func showRooms() {
        pushCoordinator.send(HotelFlowCoordinator(page: .rooms, title: previousTitle ?? nil))
    }
    
    private func showReservation() {
        pushCoordinator.send(HotelFlowCoordinator(page: .reservation))
    }
    
    private func showOrder() {
        pushCoordinator.send(HotelFlowCoordinator(page: .order))
    }
    private func popToRoot() {
        pushCoordinator.send(nil)
    }
}
