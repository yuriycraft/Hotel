//
//  ReservationView.swift
//  Hotels
//
//  Created by Lol Kek on 19/01/2024.
//

import Combine
import SwiftUI

struct ReservationView: View {
    let didClickReservationItem = PassthroughSubject<String, Never>()
    @ObservedObject var reservationVM: ReservationViewModel
    @State private var isSectionExpanded: [Int: Bool] = [:]
    var body: some View {
        ScrollViewReader { scrollView in
            List {
                if let vm = reservationVM.hotelPriceVM {
                    SectionWithoutInsets {
                        TitleCellView(viewModel: vm)
                            .listRowInsets(EdgeInsets())
                    }

                    SectionWithoutInsets {
                        ReservationDetailsView(viewModel: vm)
                            .listRowInsets(EdgeInsets())
                    }
                }
                SectionWithoutInsets {
                    BuyerInfoView(viewModel: reservationVM, phoneNumberTitle: StringConstants.phoneTitle,
                                  emailTitle: StringConstants.emailTitle)
                        .listRowInsets(EdgeInsets())
                }.id(BuyerInfoView.identifier)

                ForEach(Array(reservationVM.userInfoArray.enumerated()),
                        id: \.element.sectionTitle) { index, userInfoVM in
                    SectionWithoutInsets {
                        let isExtended = self.isSectionExpanded[index] ?? false
                        CustomDisclosureGroup(
                            animation: .easeInOut(duration: 0),
                            isExpanded: Binding(
                                get: { isExtended },
                                set: { self.isSectionExpanded[index] = $0 }
                            ),
                            prompt: {
                                SectionTappbleHeaderView(title: userInfoVM.sectionTitle,
                                                         isExpanded: isExtended,
                                                         isExpandable: true,
                                                         onTap: {
                                                             updateSectionState(index)
                                                         }, image: ImageResource.collapseShevron)
                            },
                            expandedView: {
                                TouristInformationView(viewModel: userInfoVM)
                                    .padding(.top, 0)
                                    .listRowBackground(Color.clear)
                            }
                        )
                    }.id(userInfoVM.sectionTitle)
                }

                SectionWithoutInsets {
                    HStack(spacing: 0) {
                        SectionTappbleHeaderView(title: StringConstants.addTouristTitle,
                                                 isExpanded: false,
                                                 isExpandable: false,
                                                 onTap: {
                                                     reservationVM.addNewTourist()
                                                 }, image: ImageResource.addUser)
                    }
                }

                if let vm = reservationVM.hotelPriceVM {
                    SectionWithoutInsets(content: {
                        ReservationPriceView(viewModel: vm)
                            .listRowInsets(EdgeInsets())
                    }, last: true)
                }
            }
            .listStyle(.grouped)
            .environment(\.defaultMinListHeaderHeight, 0.1)
            .listRowInsets(EdgeInsets())
                CustomButton(text: reservationVM.calculatedPrice) {
                    UIApplication.shared
                        .sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil,
                                    from: nil,
                                    for: nil)

                    reservationVM.validatePhone()
                    reservationVM.validateEmail()
                    if !reservationVM.isEmailValid
                        || !reservationVM.isPhoneValid {
                        scrollView.scrollTo(BuyerInfoView.identifier,
                                            anchor: .top)
                        return
                    } else if let invalidIndex = reservationVM.firstInvalidUserInfoIndex() {
                        guard reservationVM.userInfoArray.count > invalidIndex else {
                            return
                        }
                        forceExpandInvalidUserSection(with: invalidIndex)
                        scrollView.scrollTo(reservationVM.userInfoArray[invalidIndex].sectionTitle, anchor: .top)
                    } else {
                        didClickReservationItem.send("")
                    }
                }
                .padding(EdgeInsets(top: LayoutConstants.padding12,
                                    leading: LayoutConstants.padding16,
                                    bottom: 0,

                                    trailing: LayoutConstants.padding16))
         
        }
    }

    private func forceExpandInvalidUserSection(with index: Int) {
        isSectionExpanded[index] = true
        for (ind, _) in isSectionExpanded where ind != index {
                isSectionExpanded[ind] = false
        }
    }
    
    private func updateSectionState(_ selectedSectionIndex: Int) {
        isSectionExpanded[selectedSectionIndex] = !(isSectionExpanded[selectedSectionIndex] ?? false)
        for (index, _) in isSectionExpanded where index != selectedSectionIndex {
                isSectionExpanded[index] = false
        }
    }
}
