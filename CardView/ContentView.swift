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
            CardView()
            CardView()
           
            
        }
        
        .foregroundColor(.orange)
        .padding()
   
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack(content:  {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 50)
                    .strokeBorder(lineWidth: 10)
                Text("🤬").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 50)
            }
            
            
        })
        .padding()
    }
}











#Preview {
    ContentView()
}
