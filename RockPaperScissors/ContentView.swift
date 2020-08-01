//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Greg Stark on 01/08/2020.
//  Copyright © 2020 Gregory Stark. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(red: 29/255, green: 52/255, blue: 84/255), Color(red: 23/255, green: 31/255, blue: 64/255)]), center: .center, startRadius: 0, endRadius: 500)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text("Rock\nPapers\nScissors")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("Pick your weapon")
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
