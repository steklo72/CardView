//
//  ContentView.swift
//  CardView
//
//  Created by Fedotov Aleksandr on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🤬", "🥵", "😬", "🥶","🤯","🫤","👩‍🏭","🧣","🕶️","👜","🐱"]
    @State var cardCount: Int = 4
    
    var body: some View {
       
        VStack{
            ScrollView{
                cards}
            Spacer()
                cardCountAdjusters
        }
        .padding()
    }
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding(10)
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 130)) ]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }.aspectRatio(2/3, contentMode: .fit)
            
        }.foregroundColor(.orange)
    }
    
    func cardCountAdjuster (by offset: Int, symbol: String) -> some View {
        Button {
            
                cardCount += offset
            } label: {
            Image(systemName: symbol)
        }
            .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View {
         cardCountAdjuster(by: -1, symbol: "minus.circle")
        
    }
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "plus.square.on.square")
//        Button {
//            if cardCount < emojis.count {
//                cardCount += 1
//            }} label: {
//            Image(systemName: "plus.square.on.square")
//        }
//        "plus.square.on.square"
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 30)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 10)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill(.green).opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}











#Preview {
    ContentView()
}
