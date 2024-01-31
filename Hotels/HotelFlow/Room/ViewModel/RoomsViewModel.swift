//
//  RoomsViewModel.swift
//  Hotels
//
//  Created by Lol Kek on 29/01/2024.
//

import Foundation
import Combine

final class RoomsViewModel: ObservableObject {
    private var rooms: Rooms?
    @Published var roomCellData: [RoomCellData] = []
    
    struct RoomCellData {
        var id: Int
        var imageURLs: [String]
        var text: String
        var hotelDescription: String
        var infoData: [String]
        var price: String
        var description: String
        var buttonText: String
    }
    
    init() {
        loadDataFromNetwork()
    }

    // MARK: - Load from Network

    private func loadDataFromNetwork() {
        APIClient
            .fetch(urlString: NetworkConstants.roomsUrlString) { (result: Result<Rooms, NetworkError>) in
            switch result {
            case .success(let roomsModel):
                DispatchQueue.main.async {
                    self.rooms = roomsModel
                    self.generateRoomCellData()
                }
            case .failure(let error):
                print("Error loading reservation model: \(error)")
            }
        }
    }
    
    private func generateRoomCellData() {
        guard let rooms = rooms?.rooms else { return }
        
        roomCellData = rooms.map { room in
            let priceFormatted = String.formattedNumber(room.price ?? 0)
            return RoomCellData(
                id: room.id ?? 0,
                imageURLs: room.imageUrls ?? [],
                text: StringConstants.goToSelectRoom,
                hotelDescription: room.name ?? "",
                infoData: room.peculiarities ?? [],
                price: "\(priceFormatted) \(StringConstants.ruble)",
                description: room.pricePer?.lowercased() ?? "",
                buttonText: StringConstants.selectRoom
            )
        }
    }
}
