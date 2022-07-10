//
//  MultiGesture.swift
//  GestureHandling
//
//  Created by The YooGle on 09/07/22.
//

import SwiftUI

struct MultiGesture: View {
    
    @State private var position = CGSize.zero
    
    @GestureState private var longPressTap = false
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        VStack {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.blue)
                .opacity(longPressTap ? 0.5 : 1.0)
                .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
                .animation(.easeInOut)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .updating($longPressTap, body: { value, state, transaction in
                            state = value
                            // state refers to longPressTap variable
                            // value => true
                        })
                        .sequenced(before: DragGesture())
                        .updating($dragOffset, body: { value, state, transaction in
                            switch value {
                                case .first(true):
                                    print("Tapping")
                                case .second(true, let drag):
                                    state = drag?.translation ?? .zero
                                    // state refers to dragOffset variable
                                default:
                                    break
                            }
                        })
                        .onEnded { value in
                            guard case .second(true, let drag?) = value else { return }
                            
                            self.position.height += drag.translation.height
                            self.position.width += drag.translation.width
                        }
                )
        }
    }
}

struct MultiGesture_Previews: PreviewProvider {
    static var previews: some View {
        MultiGesture()
    }
}
