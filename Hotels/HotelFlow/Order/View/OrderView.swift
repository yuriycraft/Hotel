//
//  OrderView.swift
//  Hotels
//
//  Created by Lol Kek on 29/01/2024.
//

import SwiftUI
import Combine

struct OrderView: View {
    let didClickOrderItem = PassthroughSubject<String, Never>()
    @ObservedObject var viewModel: OrderViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Circle()
                    .frame(width: LayoutConstants.height94,
                           height: LayoutConstants.height94)
                    .foregroundColor(ColorConstants.backgroundValid)
                Image(ImageResource.partyPopper)
                    .foregroundColor(.clear)
                    .frame(width: LayoutConstants.height44,
                           height: LayoutConstants.height44)
            } .padding(.top, 122)
            Text(StringConstants.orderIsProcessed)
                .font(FontConstants.font22Medium)
                .padding(EdgeInsets(top: LayoutConstants.padding32,
                                    leading: LayoutConstants.padding16,
                                    bottom: LayoutConstants.padding16,
                                    trailing: LayoutConstants.padding16))
                .multilineTextAlignment(.center)
            Text(viewModel.confirmationText)
                .font(FontConstants.font16)
                .foregroundColor(ColorConstants.primaryText)
                .multilineTextAlignment(.center)
                .padding()
        }
        Spacer()
        
        CustomButton(text: viewModel.buttonText) {
            didClickOrderItem.send("")
        }
        .padding(EdgeInsets(top: LayoutConstants.padding12,
                            leading: LayoutConstants.padding16,
                            bottom: 0,
                            trailing: LayoutConstants.padding16))
    }
}
