//
//  HideKeyboardOnTapModifier.swift
//  WB chat
//
//  Created by Sergey Savinkov on 02.07.2024.
//

import SwiftUI
import UIKit

extension View {
    func hideKeyboardOnTap() -> some View {
        ModifiedContent(content: self, modifier: HideKeyboardOnTapModifier())
    }
}

extension View {
    func endEditing() {
        HideKeyboardOnTapModifier.hideKeyboard()
    }
}

struct HideKeyboardOnTapModifier: ViewModifier {
    
    static func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {}
                .onLongPressGesture (
                    pressing: { isPressed in
                        if isPressed {
                            Self.hideKeyboard()
                        }
                    }, perform: {}
                )
            content
        }
    }
}
