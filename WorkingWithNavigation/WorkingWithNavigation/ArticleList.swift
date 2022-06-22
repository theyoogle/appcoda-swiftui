//
//  ArticleView.swift
//  WorkingWithNavigation
//
//  Created by The YooGle on 22/06/22.
//

import SwiftUI

struct ArticleList: View {
    var body: some View {
        NavigationView {
            List(articles) { article in
                ZStack {
                    ArticleRow(article: article)
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        EmptyView()
                    }
                    .opacity(0)
                }
            }
            .navigationBarTitle("Your Reading")
        }
    }
}

struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("By \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
            
            HStack(spacing: 3) {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            
            Text(article.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}






























struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList()
    }
}
