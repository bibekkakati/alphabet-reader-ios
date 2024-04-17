//
//  ContentView.swift
//  AlphabetReaderKids
//
//  Created by Bibek Kakati on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var gameStarted = false
    
    func startGame() {
        self.gameStarted = true
    }
    
    var body: some View {
        if !gameStarted {
            SplashScreenView(handleStart: startGame)
        } else {
            AlphabetReaderView()
        }
    }
}

#Preview {
    ContentView()
}
