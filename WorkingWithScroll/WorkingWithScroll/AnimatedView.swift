//
//  AnimatedView.swift
//  WorkingWithScroll
//
//  Created by The YooGle on 09/06/22.
//

import SwiftUI

struct AnimatedView: View {
    
    @State private var show = false
    @State private var currentCardIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Reading List")
                .font(.system(size: 70, weight: .black, design: .rounded))
                .padding([.horizontal, .top])
            
            if !show {
                CardView(article: articles[currentCardIndex])
                    .transition(.scaleDownAndUp)
            }
            
            if show {
                CardView(article: articles[currentCardIndex])
                    .transition(.scaleDownAndUp)
            }
            
            Spacer()
        }
        .onTapGesture {
            self.currentCardIndex = (self.currentCardIndex + 1) % articles.count
            
            withAnimation(.spring()) {
                self.show.toggle()
            }
        }
    }
}

extension AnyTransition {
    
    static var scaleDownAndUp: AnyTransition {
        AnyTransition
            .offset(y: 600)
            .combined(with: .scale(scale: 0, anchor: .bottom))
            .combined(with: .opacity)
    }
    
    static var slideInAndOut: AnyTransition {
        AnyTransition.asymmetric(
            insertion: AnyTransition
                .offset(x: 800)
                .combined(with: .opacity)
                .combined(with: .scale(scale: 0, anchor: .trailing)),
            removal: AnyTransition
                .offset(x: -800)
                .combined(with: .opacity)
                .combined(with: .scale(scale: 0, anchor: .leading))
        )
    }
    
}
























struct AnimatedView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedView()
    }
}
