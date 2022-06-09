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
                    cardViews[0]
                    cardViews[1]
                    cardViews[2]
                    cardViews[3]
                }
            
        }
    }
}































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
