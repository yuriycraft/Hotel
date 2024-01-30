//
//  RoomsView.swift
//  Hotels
//
//  Created by Lol Kek on 12/01/2024.
//

import Combine
import SwiftUI

struct CellView: View {
    var imageURLs: [String]
    var detalsButtonText: String
    var hotelDescription: String
    var infoData: [String]
    var price: String
    var description: String
    var buttonText: String
    var didClickButtonItem: () -> Void

    init(imageURLs: [String],
         text: String,
         hotelDescription: String,
         infoData: [String],
         price: String,
         description: String,
         buttonText: String,
         didClickButtonItem: @escaping () -> Void) {
        self.detalsButtonText = text
        self.imageURLs = imageURLs
        self.hotelDescription = hotelDescription
        self.infoData = infoData
        self.price = price
        self.description = description
        self.buttonText = buttonText
        self.didClickButtonItem = didClickButtonItem
    }

    var body: some View {
        VStack {
            ZStack {
                CustomRoundedSpacer()

                VStack(alignment: .leading) {
                    PageView(urlArray: imageURLs)
                        .frame(maxWidth: .infinity, minHeight: 257, maxHeight: 257)
                        .cornerRadius(LayoutConstants.cornerRadius15)
                    Text(hotelDescription)
                        .font(FontConstants.font22Medium)

                    TrueTagView(tags: infoData)
                        .padding(.leading, -4)

                    HStack(spacing: LayoutConstants.padding2) {
                        Text(detalsButtonText)
                            .font(FontConstants.font16Medium)
                            .foregroundColor(ColorConstants.accentColor)
                            .frame(height: 19)
                        HStack(alignment: .top, spacing: LayoutConstants.padding10) {
                            Image(ImageResource.blueDisclosure)
                                .foregroundColor(.black)
                                .frame(height: 24)
                        }
                        .padding(EdgeInsets(top: 0,
                                            leading: LayoutConstants.padding10,
                                            bottom: 0,
                                            trailing: LayoutConstants.padding8))
                    }
                    .padding(EdgeInsets(top: LayoutConstants.padding2,
                                        leading: LayoutConstants.padding10,
                                        bottom: LayoutConstants.padding2,
                                        trailing: LayoutConstants.padding2))

                    .background(Color(ColorConstants.accentColor).opacity(0.10))
                    .cornerRadius(LayoutConstants.cornerRadius5)
                    PriceInfoView(price: price, description: description)
                        .padding(.top, LayoutConstants.padding8)

                    CustomButton(text: buttonText) {
                        didClickButtonItem()
                    }
                }.padding()
            }
        }
    }
}

struct RoomsView: View {
    let didClickRoomItem = PassthroughSubject<String, Never>()
    @ObservedObject var viewModel: RoomsViewModel

    var body: some View {
        List {
            ForEach(viewModel.roomCellData, id: \.id) { roomCellData in
                SectionWithoutInsets {
                    CellView(
                        imageURLs: roomCellData.imageURLs,
                        text: roomCellData.text,
                        hotelDescription: roomCellData.hotelDescription,
                        infoData: roomCellData.infoData,
                        price: roomCellData.price,
                        description: roomCellData.description,
                        buttonText: roomCellData.buttonText
                    ) {
                        self.didClickRoomItem.send("")
                    }
                }
            }
        }.listStyle(.grouped)
            .environment(\.defaultMinListHeaderHeight, 0.1)
    }
}
