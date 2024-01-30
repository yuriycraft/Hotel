//
//  ContentView.swift
//  Hotels
//
//  Created by Lol Kek on 11/01/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build()
                .navigationDestination(for: HotelFlowCoordinator.self) { coordinator in
                    coordinator.build()
                        .navigationBarBackButtonTitleHidden()
                }
        }.onAppear {
            UINavigationBar.appearance().titleTextAttributes =
            [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
        }
        .environmentObject(appCoordinator)
    }
}

#Preview {
    ContentView()
}
