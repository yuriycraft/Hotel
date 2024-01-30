//
//  HotelView.swift
//  Hotels
//
//  Created by Lol Kek on 11/01/2024.
//

import Combine
import SwiftUI

struct HotelView: View {
    @ObservedObject var viewModel: HotelViewModel
    let didClickMenuItem = PassthroughSubject<String, Never>()
    
    var body: some View {

        let header = Color.clear
            .frame(height: LayoutConstants.padding8)
            .listRowInsets(EdgeInsets())
        
        List {
            SectionWithoutInsets {
                HotelHeaderView(viewModel: viewModel)
            }
            .listSectionSeparator(.hidden)
            
            Section(header: header) {
                HotelInfoView(viewModel: viewModel)
            }
            .listSectionSeparator(.hidden)
        }
        .listStyle(.grouped)
        .environment(\.defaultMinListHeaderHeight, 0.1)
        
        CustomButton(text: StringConstants.goToSelectRoom) {
            didClickMenuItem.send(viewModel.hotelName)
        }
        .padding(EdgeInsets(top: LayoutConstants.padding12,
                            leading: LayoutConstants.padding16,
                            bottom: 0,
                            trailing: LayoutConstants.padding16))
    }
}
