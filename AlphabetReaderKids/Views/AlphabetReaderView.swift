//
//  AlphabetReaderView.swift
//  AlphabetReaderKids
//
//  Created by Bibek Kakati on 17/04/24.
//

import SwiftUI
import AVFoundation

struct AlphabetReaderView: View {
    let alphabets: [String] = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ").map({String($0)})
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let synthesizer = AVSpeechSynthesizer()
    
    @State private var clickedAlphabet = ""
    
    func readOut(letter: String) {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        
        // Create an utterance.
        let utterance = AVSpeechUtterance(string: letter)
        
        
        // Configure the utterance.
        utterance.rate = 0.3
        utterance.pitchMultiplier = 1.5
        
        synthesizer.speak(utterance)
        
    }
        
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(alphabets, id: \.self) {c in
                Text(c)
                    .font(.system(size: 64))
                    .fontWeight(.black)
                    .foregroundColor(Color("AccentColor"))
                    .scaleEffect(self.clickedAlphabet == c ? 2.0 : 1.0)
                    .onTapGesture {
                        self.readOut(letter: c)
                        self.clickedAlphabet = c
                        withAnimation(.easeOut(duration: 1.2)) {
                            self.clickedAlphabet = ""
                        }
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(height: UIScreen.main.bounds.height)
        .padding(10)
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    AlphabetReaderView()
}
