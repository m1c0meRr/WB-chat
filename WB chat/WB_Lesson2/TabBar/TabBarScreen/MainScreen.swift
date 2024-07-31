//
//  MainScreen.swift
//  WB Ypok1
//
//  Created by Sergey Savinkov on 04.06.2024.
//

import SwiftUI

struct MainScreen: View {
    
    @State var searchInput = ""
    @State var isHiding: Bool = false
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                TextField("Search", text: $searchInput)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 20)
                
                ParticleVisualizer(gradients: [.init(colors: [.indigo, .mint, .cyan])])
                    .frame(height: 200)
                
                CardGeometryView()
                    .frame(height: 250)
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: Array<GridItem>(repeating: GridItem(), count: 1)) {
                        ForEach(0...10, id: \.self) { _ in
                            Text("👺").font(.system(size: 200))
                        }
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
                .frame(maxWidth: .infinity)
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: Array<GridItem>(repeating: GridItem(), count: 1)) {
                        ForEach(0...10, id: \.self) { _ in
                            Text("🪿").font(.system(size: 200))
                        }
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
                .frame(maxWidth: .infinity)
                
                WithAnimation()
                
                ShippingBoxAnimation()
                
                GooseAnimation()
                
                iOS15Animating()
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: Array<GridItem>(repeating: GridItem(), count: 1)) {
                        ForEach(0...10, id: \.self) { _ in
                            Text("🎁").font(.system(size: 200))
                        }
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
                .frame(maxWidth: .infinity)
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: Array<GridItem>(repeating: GridItem(), count: 1)) {
                        ForEach(0...10, id: \.self) { _ in
                            Text("🥊").font(.system(size: 200))
                        }
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
                .frame(maxWidth: .infinity)
            }
            .hideKeyboardOnTap()
        }
    }
}

struct CardGeometryView: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            card
                .modifier(OrbitalEffect(percent: isAnimated ? 1 : 0, radius: 50))
                .onTapGesture {
                    withAnimation(
                        Animation.snappy(duration: 3).repeatCount(3, autoreverses: true)
                    ) {
                        isAnimated.toggle()
                    }
                }
        }
    }
    
    var card: some View {
        VStack {
            Text("Press me\nto make something")
                .frame(minHeight: 50)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
        }
    }
}

struct OrbitalEffect: GeometryEffect {
    
    var percent: Double = 0
    let radius: Double
    let initialAngle: Double = 0

    var animatableData: Double {
        get { percent }
        set { percent = newValue}
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let angle: Double = 2 * .pi * percent + initialAngle
        let point: CGPoint = .init(x: cos(angle) * radius,
                                   y: sin(angle) * radius)
        return ProjectionTransform(CGAffineTransform(translationX: point.x, y: point.y))
    }
}

struct WithAnimation: View {
    
    @State var isColoring = false
    @State var isMoving = false
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(isColoring ? .purple : .yellow)
                .frame(width: 100, height: 100)
                .offset(x: isMoving ? -120 : 120, y: 0)
            Button {
                withAnimation(.linear(duration: 3)) {
                    isColoring.toggle()
                }
                withAnimation(.default) {
                    isMoving.toggle()
                }
            } label: {
                Text("Move Kpyr")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct iOS15Animating: View {
    
    @State var isAnimating = false
    
    var body: some View {
        Button {
            isAnimating.toggle()
        } label: {
            Text("Animate me")
        }
        .foregroundColor(.white)
        .frame(width: 250, height: 140)
        .animation(.easeOut(duration: 1)) { content in
            content.background(isAnimating ? .yellow : .red)
        }
        .animation(.easeIn(duration: 3)) { content in
            content.clipShape(.rect(cornerRadius: isAnimating ? 100 : 0))
        }
        .padding()
    }
}

struct ShippingBoxAnimation: View {
    
    @State var isColoring = false
    
    var body: some View {
        HStack {
            Image(systemName: "shippingbox.fill").font(.system(size: 100)).foregroundColor(isColoring ? .mint : .pink)
                .animation(.easeIn(duration: 1), value: isColoring)
            Image(systemName: "shippingbox.fill").font(.system(size: 100)).foregroundColor(isColoring ? .red : .blue)
                .animation(.easeIn(duration: 2), value: isColoring)
            Image(systemName: "shippingbox.fill").font(.system(size: 100)).foregroundColor(isColoring ? .cyan : .orange)
                .animation(.easeIn(duration: 3), value: isColoring)
        }
            .frame(height: 150)
        Button {
            isColoring.toggle()
        } label: {
            Text("Change color")
        }
        .buttonStyle(.borderedProminent)
    }
}

struct GooseAnimation: View {
    
    @State var isMove = false
    
    var body: some View {
        Text("🪿").font(.system(size: 150))
            .offset(x: isMove ? -120 : 120, y: 0)
            .frame(width: 150, height: 150)
            .animation(.easeInOut(duration: 5), value: isMove)
        Button {
            isMove.toggle()
        } label: {
            Text("Move Goose")
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    MainScreen()
}
