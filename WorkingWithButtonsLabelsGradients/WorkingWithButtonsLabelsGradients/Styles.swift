//
//  Styles.swift
//  WorkingWithButtonsLabelsGradients
//
//  Created by The YooGle on 28/05/22.
//

import SwiftUI

struct FullWidthButtonStyle: ButtonStyle {
    
    let gradient = LinearGradient(colors: [Color("DarkGreen"), Color("LightGreen")], startPoint: .leading, endPoint: .trailing)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(gradient)
            .foregroundColor(.white)
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
}

struct CircleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.purple)
            .clipShape(Circle())
            .font(.largeTitle)
            .foregroundColor(.white)
            .rotationEffect(configuration.isPressed ? Angle(degrees: 45) : Angle(degrees: 0))
    }
    
}
