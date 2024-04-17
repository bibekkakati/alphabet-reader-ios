//
//  SplashScreenView.swift
//  AlphabetReaderKids
//
//  Created by Bibek Kakati on 17/04/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isAnimating = false
    
    var handleStart: () -> Void
    
    var body: some View {
        ZStack {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5) {
                
                Spacer()
                
                Group {
                    Image("SplashIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                    
                    Text("Hey Kido!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Text("Welcome to alphabet reader.")
                        .font(.title3)
                        .bold()
                }
                .scaleEffect(isAnimating ? 1.0 : 0.8)
                
                Spacer()
                
                if isAnimating {
                    Button(action: handleStart, label: {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 200, height: 40)
                            .overlay(
                                Text("Start Game")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .bold()
                            )
                    })
                    .padding(20)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color("BackgroundColor"))
            .onAppear() {
                withAnimation(.easeOut(duration: 1)) {
                    self.isAnimating = true
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SplashScreenView(handleStart: {})
}
