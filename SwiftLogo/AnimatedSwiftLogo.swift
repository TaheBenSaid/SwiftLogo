//
//  AnimatedSwiftLogo.swift
//  SwiftLogo
//
//  Created by tahe on 15/2/2023.
//

import SwiftUI

struct AnimatedSwiftLogo: View {
    @State private var strokeStart: CGFloat = 0.0
    @State private var strokeEnd: CGFloat = 0.0

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 253.0/255, green: 38.0/255, blue: 33.0/255),
                            Color(red: 248.0/255, green: 137.0/255, blue: 54.0/255)
                        ],
                        startPoint: .bottomTrailing,
                        endPoint: .topLeading
                    )
                )

            SwiftLogo()
                .trim(from: strokeStart, to: strokeEnd)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .foregroundColor(Color.white)
                .padding(100)
        }
        .padding(50)
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(Animation.easeIn(duration: 1.5)) {
                strokeEnd = 1.0
            }
            withAnimation(Animation.easeIn(duration: 1.5).delay(1.5)) {
                strokeStart = 1.0
            }
            withAnimation(Animation.easeIn(duration: 0.01).delay(3.0)) {
                strokeStart = 0.0
                strokeEnd = 0.0
            }
            withAnimation(Animation.easeIn(duration: 1.5).delay(3.1)) {
                strokeEnd = 1.0
            }
        }
    }
}
