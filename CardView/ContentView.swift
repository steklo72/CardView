//
//  ContentView.swift
//  CardView
//
//  Created by Fedotov Aleksandr on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🤬", "🥵", "😬", "🥶","🥶"]
    
    
    var body: some View {
       
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
            
        }
        
        .foregroundColor(.orange)
        .padding()
   
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 30)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 10)
                Text(content).font(.largeTitle)
            } else {
                base.fill(.green)
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}











#Preview {
    ContentView()
}
