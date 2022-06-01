//
//  ContentView.swift
//  WorkingWithText
//
//  Created by The YooGle on 28/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don ’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
            .fontWeight(.bold)
            .font(.system(.title, design: .rounded))        // Rounded Font
//            .font(.custom("Helvetica Neue", size: 25))
            .foregroundColor(.purple)
            .multilineTextAlignment(.center)
//            .lineLimit(3)                                 // Line Limit
//            .truncationMode(.head)                        // Works with Line Limit
            .lineSpacing(6)
            .padding()
//            .rotationEffect(.degrees(45))
//            .rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0))
            .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
            .shadow(color: .gray, radius: 2, x: 0, y: 15)
        
    }
}




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
