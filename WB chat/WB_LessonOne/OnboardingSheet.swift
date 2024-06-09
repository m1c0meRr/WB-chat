////
////  Onboarding.swift
////  WB Ypok1
////
////  Created by Sergey Savinkov on 05.06.2024.
////
//
//import SwiftUI
//
//struct Onboarding: View {
//    
//    @State var isSheetPresented = false
//    
//    var body: some View {
//        VStack {
//            Image("onboardingImage")
//                .frame(width: 262, height: 271)
//                .safeAreaPadding(.top, 135)
//            Text("Общайтесь с друзьями и близкими легко")
//                .font(.system(size: 24))
//                .bold()
//                .frame(width: 280)
//                .multilineTextAlignment(.center)
//                .padding(.top, 42)
//            Spacer()
//            
//            Button("Пользовательское соглашение") {
//                
//            }
//            .font(.system(size: 16))
//            .foregroundColor(.black)
//            .padding(.bottom, 18)
//            Button("Начать общаться") {
//                isSheetPresented = true
//            }.sheet(isPresented: $isSheetPresented) {
//                ContentView_TabView()
//            }
//            .font(.system(size: 16))
//            .frame(width: 327, height: 52)
//            .background(Color.purple)
//            .cornerRadius(30)
//            .foregroundColor(.white)
//            .padding(.bottom)
//        }
//    }
//}
//
////struct ContentView: View {
////    @State private var showNextView = false
////
////    var body: some View {
////        NavigationStack {
////            VStack {
////                // ваш контент здесь
////
////                Button(action: {
////                    self.showNextView = true
////                }) {
////                    Text("Начать общаться")
////                        .font(.headline)
////                        .foregroundColor(.white)
////                        .padding()
////                        .frame(maxWidth: .infinity)
////                        .background(Color.purple)
////                        .cornerRadius(10)
////                        .padding(.horizontal, 20)
////                }
////                .navigationDestination(isPresented: $showNextView) {
////                    NextView()
////                }
////            }
////            .navigationBarHidden(true)
////        }
////    }
////}
//
//#Preview {
//    Onboarding()
//}
