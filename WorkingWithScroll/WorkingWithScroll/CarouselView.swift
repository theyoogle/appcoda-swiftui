//
//  ContentView.swift
//  WorkingWithScroll
//
//  Created by The YooGle on 28/05/22.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
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
                
            HStack {
                Group {
                    CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                    CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                    CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                    CardView(image: "natural-language-api", category: "iOS", heading: "What's Newin Natural Language API", author: "Sai Kambampati")
                }
                .frame(width: 300)
            }
            
            Spacer()
        }
    }
}































struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
