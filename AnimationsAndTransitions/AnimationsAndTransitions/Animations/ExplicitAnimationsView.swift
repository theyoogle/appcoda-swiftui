//
//  ExplicitAnimationsView.swift
//  AnimationsAndTransitions
//
//  Created by The YooGle on 04/06/22.
//

import SwiftUI

struct ExplicitAnimationsView: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartScaleChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
            
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartScaleChanged ? 1.0 : 0.5)
        }
        .onTapGesture {
//            withAnimation(.default) {
//                circleColorChanged.toggle()
//                heartColorChanged.toggle()
//                heartScaleChanged.toggle()
//            }
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                circleColorChanged.toggle()
                heartColorChanged.toggle()
            }
            heartScaleChanged.toggle()
        }
    }
}































struct ExplicitAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimationsView()
    }
}
