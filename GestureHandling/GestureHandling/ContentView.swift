//
//  ContentView.swift
//  GestureHandling
//
//  Created by The YooGle on 01/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPressed = false
    
    @GestureState private var longPressTap = false
    
    @GestureState private var dragOffset = CGSize.zero
    
    @State private var position = CGSize.zero
    @GestureState private var dragOffset2 = CGSize.zero
    
    var body: some View {
        
        VStack {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .scaleEffect(isPressed ? 0.5 : 1.0)
                .animation(.easeInOut)
                .foregroundColor(.blue)
                .gesture(
                    TapGesture()
                        .onEnded {
                            self.isPressed.toggle()
                        }
                )
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .scaleEffect(isPressed ? 0.5 : 1.0)
                .animation(.easeInOut)
                .foregroundColor(.purple)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .onEnded { _ in
                            self.isPressed.toggle()
                        }
                )
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .opacity(longPressTap ? 0.4 : 1.0)
                .scaleEffect(isPressed ? 0.5 : 1.0)
                .animation(.easeInOut)
                .foregroundColor(.orange)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .updating($longPressTap, body: { value, state, transaction in
                            state = value
                            // state refers to longPressTap variable
                            // value => true
                        })
                        .onEnded { _ in
                            self.isPressed.toggle()
                        }
                )
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .offset(x: dragOffset.width, y: dragOffset.height)
                .animation(.easeInOut)
                .foregroundColor(.green)
                .gesture(
                    DragGesture()
                        .updating($dragOffset, body: { value, state, transaction in
                            state = value.translation
                            // state refers to dragOffset variable
                        })
                )
            
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .offset(x: position.width + dragOffset2.width, y: position.height + dragOffset2.height)
                .animation(.easeInOut)
                .foregroundColor(.black)
                .gesture(
                    DragGesture()
                        .updating($dragOffset2, body: { value, state, transaction in
                            state = value.translation
                            // state refers to dragOffset variable
                        })
                        .onEnded { value in
                            self.position.height += value.translation.height
                            self.position.width += value.translation.width
                        }
                )
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
