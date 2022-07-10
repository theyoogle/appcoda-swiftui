//
//  MultiGesture.swift
//  GestureHandling
//
//  Created by The YooGle on 09/07/22.
//

import SwiftUI

struct MultiGesture2: View {
    
    @State private var position = CGSize.zero
    @GestureState private var dragState = DragState.inactive
    
    var body: some View {
        VStack {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.blue)
                .opacity(dragState.isPressing ? 0.5 : 1.0)
                .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
                .animation(.easeInOut)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .sequenced(before: DragGesture())
                        .updating($dragState, body: { value, state, transaction in
                            switch value {
                                case .first(true):
                                    state = .pressing
                                    // state refers to dragState variable
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                    // state refers to dragState variable
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

struct MultiGesture2_Previews: PreviewProvider {
    static var previews: some View {
        MultiGesture2()
    }
}
