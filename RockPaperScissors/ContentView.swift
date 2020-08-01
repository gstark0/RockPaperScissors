//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Greg Stark on 01/08/2020.
//  Copyright © 2020 Gregory Stark. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    let weapons = ["rock", "paper", "scissors"]
    
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    // Alerts
    @State private var showingFightResult = false
    @State private var fightAlertMessage = ""
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(red: 29/255, green: 52/255, blue: 84/255), Color(red: 23/255, green: 31/255, blue: 64/255)]), center: .center, startRadius: 0, endRadius: 500)
                .edgesIgnoringSafeArea(.all)
                .alert(isPresented: $showingFightResult) {
                    Alert(title: Text("Fight!"), message: Text(fightAlertMessage))
            }
            VStack(spacing: 20) {
                Text("ROCK\nPAPER\nSCISSORS")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("Pick your weapon")
                    .foregroundColor(.white)
                VStack {
                    Weapon(playerPick: "rock", weapons: weapons, playerScore: $playerScore, cpuScore: $cpuScore, showingFightResult: $showingFightResult, fightAlertMessage: $fightAlertMessage)
                    Weapon(playerPick: "paper", weapons: weapons, playerScore: $playerScore, cpuScore: $cpuScore, showingFightResult: $showingFightResult, fightAlertMessage: $fightAlertMessage)
                    Weapon(playerPick: "scissors", weapons: weapons, playerScore: $playerScore, cpuScore: $cpuScore, showingFightResult: $showingFightResult, fightAlertMessage: $fightAlertMessage)
                }
            }
            .offset(y: -30)
            
            VStack {
                Spacer()
                HStack {
                    Score(name: "Player", score: playerScore)
                        .padding()
                        .padding()
                    Spacer()
                    Score(name: "CPU", score: cpuScore, rightSide: true)
                        .padding()
                        .padding()
                }
            }
        }
    }
}

struct Weapon: View {
    var playerPick: String
    var weapons: [String]
    
    @Binding var playerScore: Int
    @Binding var cpuScore: Int
    
    // Alerts
    @Binding var showingFightResult: Bool
    @Binding var fightAlertMessage: String
    
    var body: some View {
        Button(action: fight) {
            Image(playerPick)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 110)
        }
    }
    
    func fight() {
        let cpuPick = weapons.randomElement()
        
        // If player wins fight ..., else if draw ..., else
        if ((playerPick == "rock") && (cpuPick! == "scissors")) || ((playerPick == "paper") && (cpuPick! == "rock")) || ((playerPick == "scissors") && (cpuPick! == "paper")) {
            playerScore += 1
            fightAlertMessage = "Your opponent chose \(cpuPick!). You win this round!"
        } else if playerPick == cpuPick! {
            fightAlertMessage = "Your opponent also chose \(cpuPick!). It's a draw!"
        } else {
            cpuScore += 1
            fightAlertMessage = "Unfortunetaly, your opponent chose \(cpuPick!). You loose this round!"
        }
        showingFightResult = true
        
        if playerScore == 5 {
            // Player wins
        } else if cpuScore == 5 {
            // CPU wins
        }
    }
}

struct Score: View {
    var name: String
    var score: Int
    var rightSide = false
    
    var body: some View {
        VStack(alignment: rightSide ? .trailing : .leading) {
            Text(name)
            Text(String(score))
                .font(.system(size: 40))
        }
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
