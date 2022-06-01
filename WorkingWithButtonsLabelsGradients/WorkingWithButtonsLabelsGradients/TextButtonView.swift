//
//  ContentView.swift
//  WorkingWithButtonsLabelsGradients
//
//  Created by The YooGle on 28/05/22.
//

import SwiftUI

struct TextButtonView: View {
    var body: some View {
        
        VStack {
            
            Button {
                print("Button Tapped")
            } label: {
                Text("Button")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.title)
            }
            
            Button {
                print("Button Tapped")
            } label: {
                Text("Button")
                    .foregroundColor(.purple)
                    .font(.title)
                    .padding()
                    .border(Color.purple, width: 5)
            }
            
            Button {
                print("Button Tapped")
            } label: {
                Text("Button")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(Color.purple, width: 5)
            }
            
            Button {
                print("Button Tapped")
            } label: {
                Text("Button")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.purple, lineWidth: 5)
                    )
            }
            
        }
        
    }
}

























struct TextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonView()
    }
}
