//
//  ContentView.swift
//  CardView
//
//  Created by Fedotov Aleksandr on 05.10.2023.
//

import SwiftUI

struct ContentView: View {

    
    
    var body: some View {
        
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
           
            
        }
        
        .foregroundColor(.orange)
        .padding()
   
    }
}

struct CardView: View {
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 30)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 10)
                Text("🤬").font(.largeTitle)
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
