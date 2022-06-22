//
//  ArticleDetailView.swift
//  ModelView-FloatingButtons-Alerts
//
//  Created by The YooGle on 22/06/22.
//

import SwiftUI

struct ArticleDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlert = false
    
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(100)
                    .multilineTextAlignment(.leading)
            }
        }
        // Button will stay there on scroll
        .overlay(
            HStack {
                Spacer()
                
                VStack {
                    Button {
                        self.showAlert = true
                    } label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 40)
                    
                    Spacer()
                }
            }
        )
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Reminder"),
                message: Text("Are you sure you are finished reading the article?"),
                primaryButton: .default(Text("Yes")) {
                    self.presentationMode.wrappedValue.dismiss()
                },
                secondaryButton: .cancel(Text("No"))
            )
        }
        .edgesIgnoringSafeArea(.top)
    }
}































struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
    }
}
