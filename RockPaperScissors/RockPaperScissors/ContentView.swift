//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Abdurahman on 18.09.2026.
//

import SwiftUI

struct ContentView: View {
    let moves = ["🪨", "📃", "✂️"]
    let totalRounds = 10
    
    @State private var appChoice = Int.random(in: 0..<3)
    
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    
    @State private var showingResult = false
    @State private var round = 1
    @State private var showingGameOver = false
    
    @State private var wasCorrect = false
        
    func play(_ choice: Int) {
            let winningMove = (appChoice + 1) % 3
            let losingMove = (appChoice + 2) % 3
            let correctMove = shouldWin ? winningMove : losingMove

            wasCorrect = (choice == correctMove)
            score += wasCorrect ? 1 : -1

            if round == totalRounds {
                showingGameOver = true
            } else {
                showingResult = true
            }
    }
    
    func nextRound() {
        round += 1
        appChoice = Int.random(in: 0..<3)
        shouldWin.toggle()
    }
    
    func resetGame(){
        round = 1
        score = 0
        appChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
    
    var body: some View {
        VStack (spacing: 15){
            Spacer()
            Text(moves[appChoice])
                .font(.system(size: 80))
            Text(shouldWin ? "Win" : "Lose")
                .font(.system(size: 50))
            Spacer()
            HStack {
                ForEach(moves.indices, id: \.self) { index in
                    Button(action: {
                        play(index)
                    }) {
                        Text(moves[index])
                            .font(.system(size: 80))
                    }
                    .padding()
                }
            }
            Spacer()
            Text("Round: \(round)/\(totalRounds)")
                .font(.title.italic())
            Text("Score: \(score)")
                .font(.title.bold())
            Spacer()
        }
        .alert(wasCorrect ? "Correct" : "Wrong", isPresented: $showingResult) {
            Button("Continue", action: nextRound)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over", isPresented: $showingGameOver){
            Button("Play again", action: resetGame)
        } message: {
            Text("Final score is \(score)")
        }
    }
}


#Preview {
    ContentView()
}
