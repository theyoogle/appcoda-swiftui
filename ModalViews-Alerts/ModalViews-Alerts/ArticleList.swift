//
//  ArticleList.swift
//  ModelView-FloatingButtons-Alerts
//
//  Created by The YooGle on 22/06/22.
//

import SwiftUI

struct ArticleList: View {
    
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationView {
            List(articles) { article in
                ArticleRow(article: article)
                    .onTapGesture {
                        self.selectedArticle = article
                    }
            }
            .sheet(item: self.$selectedArticle) { article in
                ArticleDetailView(article: article)
            }
            // Shows full screen modal instead of sheet
//            .fullScreenCover(item: self.$selectedArticle) { article in
//                ArticleDetailView(article: article)
//            }
            
            .navigationBarTitle("Your Reading")
        }
        // For iPadOS, which shows list as NavBar
        .navigationViewStyle(.stack)
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
