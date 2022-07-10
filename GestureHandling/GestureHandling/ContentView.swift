//
//  ContentView.swift
//  GestureHandling
//
//  Created by The YooGle on 01/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPressed = false
    @State private var position = CGSize.zero
    
    @GestureState private var longPressTap = false
    @GestureState private var dragOffset = CGSize.zero
    @GestureState private var dragOffset2 = CGSize.zero
    @GestureState private var scaleFactor: CGFloat = 1.0
    
    var body: some View {
        
        VStack {
            // Tap
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.blue)
                .scaleEffect(isPressed ? 0.5 : 1.0)
                .animation(.easeInOut)
                .gesture(
                    TapGesture()
                        .onEnded {
                            self.isPressed.toggle()
                        }
                )
            
            // Long Press
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.purple)
                .scaleEffect(isPressed ? 0.5 : 1.0)
                .animation(.easeInOut)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .onEnded { _ in
                            self.isPressed.toggle()
                        }
                )
            
            // Long Press
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.orange)
                .opacity(longPressTap ? 0.4 : 1.0)
                .scaleEffect(isPressed ? 0.5 : 1.0)
                .animation(.easeInOut)
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
            
            // Drag
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.green)
                .offset(x: dragOffset.width, y: dragOffset.height)
                .animation(.easeInOut)
                .gesture(
                    DragGesture()
                        .updating($dragOffset, body: { value, state, transaction in
                            state = value.translation
                            // state refers to dragOffset variable
                        })
                )
            
            // Drag
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.pink)
                .offset(x: position.width + dragOffset2.width, y: position.height + dragOffset2.height)
                .animation(.easeInOut)
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
            
            // Magnification
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.black)
                .scaleEffect(scaleFactor)
                .animation(.default)
                .gesture(
                    MagnificationGesture()
                        .updating($scaleFactor, body: { value, state, transaction in
                            state = value
                            // state refers to scaleFactor variable
                        })
                )
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
