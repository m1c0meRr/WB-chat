//
//  VerificationCodeView.swift
//  WBApp
//
//  Created by Sergey Savinkov on 29.07.2024.
//

import SwiftUI

struct VerificationCodeView: View {
    @State var contact = VerificationModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.backgroundWB
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Ведите код")
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.mainTextWB)
                Text("Отправили код на номер")
                    .padding(.top, 8)
                    .font(.system(size: 14))
                    .foregroundStyle(.mainTextWB)
                Text("+7 000 000-00-00")
                    .padding(.top, 2)
                    .font(.system(size: 14))
                    .foregroundStyle(.mainTextWB)
                VerificationPromptView(contact: $contact.code, numberOfCircles: 4)
                    .padding(.top, 49)
                CodeView(contact: $contact)
                Button {
                    
                } label: {
                    Text("Запросить код повторно")
                        .font(.system(size: 16))
                        .foregroundStyle(.pinkTextWB)
                        .padding()
                }
                .padding(.top, 69)
                .padding(25)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    VerificationCodeView()
}
