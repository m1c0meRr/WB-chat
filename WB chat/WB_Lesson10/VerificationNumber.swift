//
//  VerificationNumber.swift
//  WB chat
//
//  Created by Sergey Savinkov on 29.07.2024.
//

import SwiftUI
import UIKit

struct PhoneInputView: View {
    @State private var phoneNumber: String = ""
    @State private var showProgress: Bool = false
    @State private var selectedLocale = Locale.current
    
    let flags: [String] = ["🇷🇺 +7"]
    let locales: [Locale] = [
        Locale(identifier: "ru_RU")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.systemGray6)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Введите номер телефона")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                        .padding(.top, 200)
                    Text("Мы вышлем код подтверждения на указанный номер")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    HStack {
                        Text("🇷🇺+7")
                            .foregroundColor(.gray)
                        TextField("000 000-00-00", text: $phoneNumber)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .keyboardType(.numberPad)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    
                    Button(action: {
                        showProgress = true
                        HideKeyboardOnTapModifier.hideKeyboard()
                    }) {
                        Text("Продолжить")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(30)
                    }
                    .padding(.horizontal)
                    .disabled(phoneNumber.isEmpty)
                    
                    Spacer()
                        .padding(.bottom, 20)
                }
                .navigationTitle("")
                .navigationBarHidden(true)
                
                if showProgress {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(2)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                showProgress = false
                            }
                        }
                }
            }
        }
    }
}

struct PreviewsNumberInput: PreviewProvider {
    static var previews: some View {
        PhoneInputView()
    }
}
