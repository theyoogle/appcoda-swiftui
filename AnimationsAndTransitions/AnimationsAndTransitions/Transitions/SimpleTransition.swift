//
//  SimpleTransition.swift
//  AnimationsAndTransitions
//
//  Created by The YooGle on 08/06/22.
//

import SwiftUI

// Transition will only work with Animation
// No transition specified - there is always a default transition

struct SimpleTransition: View {
    
    @State private var show = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text("Show details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.show.toggle()
                    }
                }
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Well, here is the details.")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    )
//                    .transition(.scale(scale: 0, anchor: .bottom))
//                    .transition(.offset(x: -600, y: 0))
//                    .transition(
//                        .offset(x: -600, y: 0)
//                        .combined(with: .scale)
//                    )
//                    .transition(
//                        .offset(x: -600, y: 0)
//                        .combined(with: .scale)
//                        .combined(with: .opacity)
//                    )
//                    .transition(.myTransition)
                    .transition(.asymetricExample)
            }
        }
    }
}

extension AnyTransition {
    static var myTransition: AnyTransition {
        AnyTransition
            .offset(x: -600, y: 0)
            .combined(with: .scale)
    }
    
    static var asymetricExample: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .bottom),
            removal: .offset(x: -600, y: 0)
        )
    }
}




















struct SimpleTransition_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTransition()
    }
}
