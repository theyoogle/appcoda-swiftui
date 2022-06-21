//
//  ContentView.swift
//  WorkingWithScroll
//
//  Created by The YooGle on 28/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Monday, AUG 20".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Your Reading")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.black)
                }
                Spacer()
            }
            .padding([.top, .horizontal])
            
            VStack {
                CardView(article: articles[0])
                CardView(article: articles[1])
                CardView(article: articles[2])
                CardView(article: articles[3])
            }
            
        }
    }
}































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
