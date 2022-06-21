//
//  ContentView.swift
//  WorkingWithScroll
//
//  Created by The YooGle on 23/05/22.
//

import SwiftUI

struct CardView: View {
    
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(article.category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(article.heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    Text("Written by \(article.author)".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding([.horizontal, .top])
            
            Group {
                HStack(spacing: 3.0) {
                    ForEach(1...(article.rating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }
                
                Text(article.excerpt)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.secondary)
            }
            .padding([.horizontal, .bottom])
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,
                              opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}












struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(article: articles[1])
    }
}
