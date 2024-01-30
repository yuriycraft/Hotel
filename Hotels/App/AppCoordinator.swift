//
//  AppCoordinator.swift
//  Hotels
//
//  Created by Lol Kek on 11/01/2024.
//

import Combine
import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath
    private var cancellables = Set<AnyCancellable>()
    var rootCoordinator: HotelFlowCoordinator?
    
    init(path: NavigationPath) {
        self.path = path
    }
    
    @ViewBuilder
    func build() -> some View {
        start()
    }
    
    private func start() -> some View {
        rootCoordinator = HotelFlowCoordinator(page: .hotel)
        bind(hotelCoordinator: rootCoordinator!)
        let view = rootCoordinator!.build()
        return view
    }
    
    private func push<T: Hashable>(_ coordinator: T?) {
        if let coordinator = coordinator {
            path.append(coordinator)
        }
    }
    
    private func popToRoot() {
        path.removeLast(path.count)
        self.cancellables.removeAll()
    }

    // MARK: Flow Coordinator Bindings

    private func bind(hotelCoordinator: HotelFlowCoordinator) {
        hotelCoordinator.pushCoordinator
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] coordinator in
                guard let coordinator = coordinator else {
                    self?.popToRoot()
                return
                }
                self?.bind(hotelCoordinator: coordinator)
                self?.push(coordinator)
            })
            .store(in: &cancellables)
    }
}
