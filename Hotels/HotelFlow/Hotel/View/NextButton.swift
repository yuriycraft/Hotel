//
//  NextButton.swift
//  Hotels
//
//  Created by Lol Kek on 14/01/2024.
//

import SwiftUI

struct TextModifier: ViewModifier {
    var font: Font
    var tracking: CGFloat
    var lineSpacing: CGFloat
    var color: Color

    func body(content: Content) -> some View {
        content
            .font(font)
            .tracking(tracking)
            .lineSpacing(lineSpacing)
            .foregroundColor(color)
    }
}

struct NextButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: NextButtonConstants.verticalPadding,
                                leading: NextButtonConstants.horizontalPadding,
                                bottom: NextButtonConstants.verticalPadding,
                                trailing: NextButtonConstants.horizontalPadding))
            .frame(maxWidth: .infinity)
            .frame(height: NextButtonConstants.buttonHeight)
            .foregroundColor(.white)
            .background(ColorConstants.accentColor)
            .cornerRadius(LayoutConstants.cornerRadius15)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}

struct CustomButton: View {
    var text: String = ""
    var action: () -> Void

    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }

    var textConfig: TextModifier = .init(
        font: FontConstants.font16Medium,
        tracking: 0.10,
        lineSpacing: 17.60,
        color: .white
    )

    var body: some View {
        Button(action: action) {
            Text(text)
                .modifier(textConfig)
        }
        .buttonStyle(NextButtonStyle())
        .frame(alignment: .bottom)
    }
}
